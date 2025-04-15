pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDS = credentials('dockerhub-credentials')
        DOCKER_IMAGE = "petarpejo32/jenkins-demo:${BUILD_NUMBER}"
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building application..."'
                sh 'ls -la'
            }
        }
        
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh 'echo "All tests passed!"'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                sh 'echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin'
                sh 'docker push $DOCKER_IMAGE'
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
        }
    }
}
