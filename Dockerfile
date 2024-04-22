# Use Node.js 18 image as base
# FROM node:18-alpine
FROM node:18.18.2-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json  ./
RUN yarn install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN yarn build

# Expose port 3000
EXPOSE 3000

# Run the Next.js app
CMD ["yarn", "start"]
