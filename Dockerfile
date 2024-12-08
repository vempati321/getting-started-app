FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy application code to the container
COPY . .

# Install dependencies
RUN yarn install --production

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "src/index.js"]
