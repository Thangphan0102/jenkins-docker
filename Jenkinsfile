// Example of a Jenkinsfile
pipeline {
    agent {
        node {
            label 'docker-agent-python'
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