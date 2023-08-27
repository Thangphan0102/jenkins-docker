// Example of a Jenkinsfile
pipeline {
    agent {
        node {
            label 'docker-agent'
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