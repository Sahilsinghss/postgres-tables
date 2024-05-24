pipeline {
    agent any
    environment {
        OPENSHIFT_PROJECT = 'devopsdaemon-dev'
        POD_NAME = 'postgres-deployment-b4496ff5-nm8ws' // Directly specify the pod name
        SQL_SCRIPT = 'script.sql' // Path to your .sql script in the workspace
        POSTGRES_USER = 'postgres-user' // Adjust as necessary
        POSTGRES_DB = 'postgres' // Adjust as necessary
        GIT_URL = 'https://github.com/Sahilsinghss/postgres-tables.git' // Git URL
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
                    checkout([$class: 'GitSCM', branches: [[name: "${params.GIT_BRANCH}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: GIT_URL, credentialsId: GIT_CREDS]]])
                    echo "Cloned code is in directory: ${pwd()}"
                }
            }
        }

        stage('Copy SQL Script to Pod') {
            steps {
                script {
                    openshift.withCluster(env.CLUSTER, env.OPENSHIFTCREDENTIALS) {
                        openshift.withProject(OPENSHIFT_PROJECT) {
                            // Ensure the pod name is provided
                            if (!POD_NAME) {
                                error "Pod name must be specified."
                            }
                            echo "Found PostgreSQL pod: ${POD_NAME}"

                            // Copy the SQL script to the pod
                            def sqlContent = readFile(file: SQL_SCRIPT)
                            openshift.selector('pod', POD_NAME).exec('/bin/sh', '-c', "echo '${sqlContent}' > /tmp/script.sql")
                            echo "SQL script copied to pod: ${POD_NAME}"
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
                            // Ensure the pod name is provided
                            if (!POD_NAME) {
                                error "Pod name must be specified."
                            }

                            // Execute the SQL script in the pod
                            openshift.selector('pod', POD_NAME).exec('/bin/sh', '-c', """
                                psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f /tmp/script.sql
                            """)
                            echo "SQL script executed in pod: ${POD_NAME}"
                        }
                    }
                }
            }
        }
    }
}
