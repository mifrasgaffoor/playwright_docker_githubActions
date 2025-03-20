# Use the official Playwright image with dependencies
FROM mcr.microsoft.com/playwright:v1.41.0

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first (improves caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Install Playwright browsers
RUN npx playwright install --with-deps

# Install Allure Playwright reporter
RUN npm install --save-dev allure-playwright

# Run Playwright tests and generate Allure report
CMD ["npx", "playwright", "test", "--reporter=allure"]
