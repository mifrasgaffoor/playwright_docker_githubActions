# Use Playwright’s official image
FROM mcr.microsoft.com/playwright:v1.51.1-focal

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy all test files
COPY . .

# Install Playwright Browsers
RUN npx playwright install --with-deps

# Run Playwright tests inside the container
CMD ["npm", "test"]
