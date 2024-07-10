pipeline {
    agent any
    
    environment {
        dockerImage = 'prabha20/prabha_repo'
        tagName = 'tagname'
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    def dockerImageId = docker.build "${dockerImage}:${tagName}"
                    
                    // Tag the image with latest (optional)
                    dockerImageId.tag "${dockerImage}:latest"
                }
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                script {
                    // Push the tagged images to DockerHub
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                        dockerImageId.push "${tagName}"
                        dockerImageId.push 'latest'  // Push the latest tag if needed
                    }
                }
            }
        }
    }
}
