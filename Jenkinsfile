// Example of a Jenkinsfile
pipeline {
    agent {
        docker {
            image 'python:3.9-slim'
        }
    }

    stages {
        stage('Test') {
            steps {
                bash 'docker info'
            }
        }
    }
}