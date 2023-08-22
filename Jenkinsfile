pipeline {
    agent {
        docker { image 'node:18.17.1-alpine3.18' }
    }
    stages {
        stage('Test') {
            steps {
                sh "chmod +x -R ${env.WORKSPACE}"
                sh 'node --version'
            }
        }
    }
}
