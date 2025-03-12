pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/6lvckmania/test-task.git', credentialsId: 'github-credentials'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t my-python-app:latest ."
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    sh "docker-compose up -d"
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh "curl -I http://localhost:5000"
                }
            }
        }
    }
}