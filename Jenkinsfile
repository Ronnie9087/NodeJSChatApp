pipeline {
    agent any

    environment {
        // Define your GitHub repository URL here
        GIT_REPO_URL = 'https://github.com/Ronnie9087/NodeJSChatApp.git'  // Change this to your repo's URL
        // GIT_REPO_URL = 'git@github.com:Ronnie9087/NodeJSChatApp.git'  // Uncomment this for SSH usage

        // Optionally, set up proxy settings (if behind a proxy)
        GIT_PROXY = 'http://proxy.example.com:8080'  // Uncomment and set this if needed
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        // If using HTTPS, use credentialsId for GitHub authentication
                        // Make sure to configure the credentials in Jenkins (GitHub token or username/password)
                        if (GIT_REPO_URL.startsWith('https://')) {
                            // Set proxy if necessary
                            if (env.GIT_PROXY) {
                                sh 'git config --global http.proxy $GIT_PROXY'
                                sh 'git config --global https.proxy $GIT_PROXY'
                            }
                            git url: "${env.GIT_REPO_URL}", credentialsId: 'your-credential-id'  // Replace with your credential ID
                        }
                        // If using SSH, ensure you have the SSH keys set up in Jenkins credentials
                        else if (GIT_REPO_URL.startsWith('git@github.com:')) {
                            git url: "${env.GIT_REPO_URL}", credentialsId: 'your-ssh-credential-id'  // Replace with SSH credential ID
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        echo "Git checkout failed: ${e.message}"
                        throw e
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building..'
                // Add your build steps here (e.g., npm install, Maven build, etc.)
            }
        }

        stage('Test') {
            steps {
                echo 'Testing..'
                // Add your test steps here (e.g., npm test, JUnit tests, etc.)
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
                // Add your deploy steps here (e.g., deploy to AWS, Azure, etc.)
            }
        }
    }

    post {
        always {
            echo 'Cleaning up..'
            // Add cleanup steps here if necessary
        }

        success {
            echo 'Pipeline succeeded!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
