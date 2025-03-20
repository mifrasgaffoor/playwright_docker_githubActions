# Use Playwright image with Ubuntu focal (or another base image if needed)
FROM mcr.microsoft.com/playwright:v1.28.0-focal

# Install Node.js version 18
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Copy your application code
COPY . .

# Install dependencies
RUN npm ci

# Run Playwright installation with dependencies
RUN npx playwright install --with-deps

# Expose any necessary ports
EXPOSE 3000

# Command to run the application or tests
CMD ["npm", "test"]
