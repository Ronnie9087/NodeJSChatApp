pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ronnie9087/NodeJSChatApp.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Snyk SCA and SAST') {
            steps {
                sh 'snyk test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nodejs-chat-app .'
            }
        }
        stage('Run Application') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
