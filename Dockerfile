# Use Node.js LTS version
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the application source code
COPY . .

# Create and use a non-root user
RUN useradd -m appuser
USER appuser

# Expose the application port
EXPOSE 3000

# Add a health check (optional)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s CMD curl -f http://localhost:3000/health || exit 1

# Start the application
CMD ["node", "index.js"]
