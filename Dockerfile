# Use Playwright's official image
FROM mcr.microsoft.com/playwright:v1.28.0-focal

# Set the working directory
WORKDIR /app

# Install required dependencies and setup Playwright
COPY . .
RUN npm ci

# Run tests
CMD ["npm", "test"]
