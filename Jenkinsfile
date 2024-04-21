pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from the repository
                git 'https://github.com/oasis63/my-next-app1'
            }
        }
        
        stage('Install') {
            steps {
                // Install dependencies
                sh 'yarn install'
            }
        }
        
        stage('Build') {
            steps {
                // Build Next.js app
                sh 'yarn build'
            }
        }
        
        stage('Docker Build and Push') {
            steps {
                // Build Docker image for the Next.js app
                script {
                    def dockerImage = docker.build('my-nextjs-app:v1')
                    docker.withRegistry('https://oasisdevzone.jfrog.io/artifactory/tf-trial/', 'artifactoryCredentials') {
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                // Pull the latest Docker image from the registry
                script {
                    docker.image('my-nextjs-app:v1').pull()
                }
                // Deploy the latest Docker image
                // Add deployment steps here
            }
        }
    }
}
