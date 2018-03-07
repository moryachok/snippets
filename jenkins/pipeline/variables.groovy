

pipeline {
    agent any
    environment { //will apply to all steps within the Pipeline
        CC = 'clang'
    }
    stages {
        stage('Example') {
            environment { //will only apply the given environment variables to steps within the stage.
                DEBUG_FLAGS = '-g'
            }
            environment {
                // credentials() directive will keep its contents hidden from the logs
                BITBUCKET_COMMON_CREDS = credentials('jenkins-bitbucket-common-creds') 
                // BITBUCKET_COMMON_CREDS - username:password
                // BITBUCKET_COMMON_CREDS_USR - username
                // BITBUCKET_COMMON_CREDS_PSW - password
            }
            steps {
                sh 'printenv'
            }
        }
    }
}

////////////////////////////////////////////////////
//// SCRIPTED //////////////////////////////////////
////////////////////////////////////////////////////   

node {
    /* .. snip .. */
    withEnv(["PATH+MAVEN=${tool 'M3'}/bin"]) {
        sh 'mvn -B verify'
    }
}