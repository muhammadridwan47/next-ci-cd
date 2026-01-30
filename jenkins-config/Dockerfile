FROM jenkins/jenkins:lts

USER root

# 1. Install Docker CLI
# Ini diperlukan agar Jenkins bisa menjalankan perintah 'docker build'
RUN apt-get update && \
    apt-get install -y apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg \
                       lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# 2. Install Node.js (Versi 18)
# Ini diperlukan agar kita bisa test & install npm langsung di Jenkins tanpa docker-in-docker yang rumit
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Kembali ke user root (atau jenkins jika permission sudah diatur, tapi root paling aman untuk setup awal)
USER root