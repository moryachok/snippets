pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building.. ${env.BUILD_ID}"
            }
        }
        stage('Test') {
            steps {
                echo "Testing.. ${env.JOB_NAME}"
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying.. ${env.JOB_NAME}"
            }
        }
    }
}

////////////////////////////////////////////////////
//// SCRIPTED //////////////////////////////////////
////////////////////////////////////////////////////   

node {
    stage('Build') {
        echo 'Building....'
    }
    stage('Test') {
        echo 'Building....'
    }
    stage('Deploy') {
        echo 'Deploying....'
    }
}