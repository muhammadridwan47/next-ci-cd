# FROM jenkins/jenkins:lts

# USER root

# # 1. Install dependencies dasar & Node.js 18
# RUN apt-get update && \
#     apt-get install -y lsb-release python3-pip curl gnupg && \
#     curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
#     apt-get install -y nodejs

# # 2. Setup Repository Docker & Install Docker CLI
# # (Langkah ini yang sebelumnya kurang)
# RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#   https://download.docker.com/linux/debian/gpg

# RUN echo "deb [arch=$(dpkg --print-architecture) \
#   signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#   https://download.docker.com/linux/debian \
#   $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# RUN apt-get update && apt-get install -y docker-ce-cli

# # Kembali ke user jenkins agar aman
# USER jenkins

FROM jenkins/jenkins:lts

USER root

# 1. Install dependencies & Node.js 20 (WAJIB untuk Next.js 16)
RUN apt-get update && \
    apt-get install -y lsb-release python3-pip curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# 2. Setup Repository Docker & Install Docker CLI
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins