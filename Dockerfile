# Menggunakan Node versi ringan
FROM node:18-alpine

WORKDIR /app

# Copy package.json dan install dependencies
COPY package*.json ./
RUN npm install

# Copy semua source code
COPY . .

# Build Next.js
RUN npm run build

# Expose port (default 3000, tapi nanti kita mapping saat run)
EXPOSE 3000

# Command start
CMD ["npm", "start"]