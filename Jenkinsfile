pipeline {
    agent {
        docker { image 'hello-world:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'pwd'
            }
        }
    }
}
