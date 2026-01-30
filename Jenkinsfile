pipeline {
    agent any
    
    // Variabel environment global
    environment {
        // Nama image docker aplikasi anda
        IMAGE_NAME = "my-nextjs-app"
    }

    stages {
        // 1. Install & Test (Dijalankan di semua branch)
        stage('Install & Test') {
            steps {
                echo 'Installing Dependencies...'
                // Kita gunakan docker sementara untuk test agar tidak mengotori jenkins
                // Jenkins akan meminjam image node untuk menjalankan perintah ini
                sh 'docker run --rm -v ${WORKSPACE}:/app -w /app node:18-alpine npm install'
                
                echo 'Running Unit Tests...'
                sh 'docker run --rm -v ${WORKSPACE}:/app -w /app node:18-alpine npm test'
            }
        }

        // 2. Build Docker Image (Hanya jika test lolos)
        stage('Build Image') {
            steps {
                echo "Building Docker Image..."
                // Build image dengan tag nama branch (misal: my-nextjs-app:main)
                sh "docker build -t ${IMAGE_NAME}:${BRANCH_NAME} ."
            }
        }

        // 3. Deploy (Logika Port Berdasarkan Branch)
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
                        // Jika branch lain (misal dev/feature), skip deploy atau error
                        echo "Branch ${BRANCH_NAME} tidak dideploy otomatis."
                        return
                    }

                    echo "Deploying branch ${BRANCH_NAME} to port ${hostPort}..."

                    // Hapus container lama jika ada (ignore error jika tidak ada)
                    sh "docker rm -f ${containerName} || true"

                    // Jalankan container baru
                    // -d: detach (background)
                    // -p: mapping port (Host:Container)
                    // --restart unless-stopped: auto restart jika server reboot
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