pipeline {
    agent any

    environment {
        IMAGE_NAME = "<dockerhub-username>/webapp"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/<your-username>/jenkins-cicd-ubuntu.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t webapp .'
            }
        }

        stage('Tag & Push Image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKER_PASS')]) {
                    sh '''
                      docker login -u <dockerhub-username> -p $DOCKER_PASS
                      docker tag webapp $IMAGE_NAME:latest
                      docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }

        stage('Deploy on Ubuntu') {
            steps {
                sh 'bash deploy.sh'
            }
        }
    }
}
