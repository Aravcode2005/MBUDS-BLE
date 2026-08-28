pipeline {
    agent any

    environment {
        APP_NAME = 'moodbuds'
        DOCKERFILE = 'Dockerfile'
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_HOST = 'tcp://elated_robinson:2375'
        DOCKER_CERT_PATH = ''
        DOCKER_TLS_VERIFY = ''
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code'
                checkout scm
            }
          }


        stage('Verify Environment') {
            steps {
                sh '''
                    node --version
                    npm --version
                    docker --version
                    docker info
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    echo 'We are performing the tests now'
                    npm test
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                        -f "$DOCKERFILE" \
                        -t "$APP_NAME:$IMAGE_TAG" \
                        -t "$APP_NAME:$GIT_COMMIT" \
                        .
                '''
            }
        }
    }
}
post{
    success{
   echo "CI built.Built ${APP_NAME}:${IMAGE_TAG}"
      }
    failure{
    
    echo "Pipeline failed. Check the failed stage logs"
      }
    always{
     echo "The Build for ${BUILD_NUMBER} has completed"
      }
 
    }

}
