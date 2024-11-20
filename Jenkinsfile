pipeline {
    agent any

    environment {
        // GitHub repository URL
        GIT_REPO_URL = 'https://github.com/Ronnie9087/NodeJSChatApp.git' // Update as needed

        // Jenkins credentials ID for GitHub
        GIT_CREDENTIALS_ID = 'your-credential-id' // Replace with the actual credential ID
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        echo "Checking out from ${GIT_REPO_URL}"
                        git url: GIT_REPO_URL, credentialsId: GIT_CREDENTIALS_ID
                    } catch (Exception e) {
                        echo "Git checkout failed: ${e.message}"
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Add deployment steps here
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs() // Clean workspace after build
        }

        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Please check logs.'
        }
    }
}
