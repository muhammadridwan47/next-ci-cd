pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "my-nextjs-app"
    }

    stages {
        // PERUBAHAN DI SINI:
        // Kita tidak pakai 'docker run' lagi untuk install/test.
        // Kita pakai 'npm' langsung karena sudah diinstall di Dockerfile Jenkins tadi.
        stage('Install & Test') {
            steps {
                echo 'Installing Dependencies...'
                sh 'npm install'
                
                // echo 'Running Unit Tests...'
                // sh 'npm test'
            }
        }

        stage('Build Image') {
            steps {
                echo "Building Docker Image..."
                // Build docker image aplikasi (Next.js)
                sh "docker build -t ${IMAGE_NAME}:${BRANCH_NAME} ."
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def containerName = "nextjs-${BRANCH_NAME}"
                    def hostPort = ""

                    if (env.BRANCH_NAME == 'main') {
                        hostPort = "3000"
                    } else if (env.BRANCH_NAME == 'release') {
                        hostPort = "3001"
                    } else {
                        echo "Branch ${BRANCH_NAME} skip deploy."
                        return
                    }

                    echo "Deploying branch ${BRANCH_NAME} to port ${hostPort}..."

                    sh "docker rm -f ${containerName} || true"

                    sh """
                        docker run -d \
                        --name ${containerName} \
                        --restart unless-stopped \
                        -p ${hostPort}:3000 \
                        ${IMAGE_NAME}:${BRANCH_NAME}
                    """
                }
            }
        }
    }
}