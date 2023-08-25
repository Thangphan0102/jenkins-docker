// Example of a Jenkinsfile
pipeline {
    agent {
        docker {
            image 'node:18.17.1-alpine3.18'
        }
    }

    stages {
        stage('Test') {
            steps {
                sh 'docker info'
            }
        }
    }
}