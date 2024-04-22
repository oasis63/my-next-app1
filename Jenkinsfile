/* groovylint-disable CompileStatic */
pipeline {
    agent any

    tools {
        nodejs '18.18.2'
    }

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
                sh '''docker  build  -t  my-next-app:v${BUILD_NUMBER} .'''
                sh '''docker  tag  my-next-app:v${BUILD_NUMBER}   oasisdevzone.jfrog.io/in1a-project1/my-next-app:v${BUILD_NUMBER}'''
                sh '''echo "cmVmdGtuOjAxOjE3NDUzNDUzMjc6bDhqcVVNQ3J0NUdQNHVxTXYweEFOMGllQ3Jy" | docker login oasisdevzone.jfrog.io -u rajeshbosak89@gmail.com --password-stdin'''
                sh '''docker  push  oasisdevzone.jfrog.io/in1a-project1/my-next-app:v${BUILD_NUMBER}'''

            // Build Docker image for the Next.js app
            // script {
            //     def dockerImage = docker.build('my-nextjs-app:v1')
            //     docker.withRegistry('https://oasisdevzone.jfrog.io/artifactory/tf-trial/', 'artifactoryCredentials') {
            //         dockerImage.push()
            //     }
            // }
            }
        }
        stage('Deploy') {
            steps {
                // Pull the latest Docker image from the registry
                script {
                    docker.image('my-next-app:v${BUILD_NUMBER}').pull()
                }
            // Deploy the latest Docker image
            // Add deployment steps here
            }
        }
    }
}
