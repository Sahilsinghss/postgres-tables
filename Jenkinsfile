pipeline {
    agent any
    environment {
        OPENSHIFT_PROJECT = 'devopsdaemon-dev'
        DEPLOYMENT_NAME = 'postgres-deployment'
        SQL_SCRIPT = '${WORKSPACE}/script.sql' // Path to your .sql script in the workspace
        POSTGRES_USER = 'postgres-user' // Adjust as necessary
        POSTGRES_DB = 'postgres' // Adjust as necessary
        GIT_URL = 'https://github.com/Sahilsinghss/postgres-tables.git' //git url
        GIT_CREDS = 'jenkins'
        GIT_BRANCH = 'main'
        OPENSHIFTCREDENTIALS = credentials('postgres-token-oc')
        CLUSTER = 'devopsdaemon-dev'
    }
    stages {
        stage('Git Clone') {
            steps {
                script {
                    // Clean workspace before cloning (optional)
                    deleteDir()
                    
                    // Git clone
                    checkout([$class: 'GitSCM', branches: [[name: "${params.GIT_BRANCH}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: GIT_URL,credentialsId: GIT_CREDS]]])
                    echo "Cloned code is in directory: ${pwd()}"
                }
            }
        }


        stage('Copy SQL Script to Pod') {
            steps {
                script {
                    openshift.withCluster(env.CLUSTER, env.OPENSHIFTCREDENTIALS) {
                        echo "1"
                        openshift.withProject(OPENSHIFT_PROJECT) {
                            // Get the pods associated with the deployment
                            echo "2"
                            def pods = openshift.selector('deploymentconfig', DEPLOYMENT_NAME).related('pods')
                            echo "3"
                            def podNames = pods.names()
                            echo "4"

                            // Ensure there's at least one pod
                            if (podNames.size() == 0) {
                                error "No pods found for deployment: ${DEPLOYMENT_NAME}"
                            }

                            // Get the name of the first pod
                            def podName = podNames[0]
                            echo "Found PostgreSQL pod: ${podName}"

                            // Copy the SQL script to the pod
                            def sqlContent = readFile(file: SQL_SCRIPT)
                            echo "5"
                            openshift.selector('pod', podName).exec('/bin/sh', '-c', "echo '${sqlContent}' > /tmp/script.sql")
                            echo "6"
                        }
                    }
                }
            }
        }
        stage('Run SQL Script on PostgreSQL Pod') {
            steps {
                script {
                    openshift.withCluster(env.CLUSTER, env.OPENSHIFTCREDENTIALS) {
                        openshift.withProject(OPENSHIFT_PROJECT) {
                            // Get the pods associated with the deployment
                            def pods = openshift.selector('deploymentconfig', DEPLOYMENT_NAME).related('pods')
                            def podNames = pods.names()

                            // Get the name of the first pod
                            def podName = podNames[0]

                            // Execute the SQL script in the pod
                            openshift.selector('pod', podName).exec('/bin/sh', '-c', """
                                psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f /tmp/script.sql
                            """)
                        }
                    }
                }
            }
        }
    }
}
