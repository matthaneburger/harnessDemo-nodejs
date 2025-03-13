FROM node:20-alpine AS development
ENV NODE_ENV=development
#Install git with other dependencies
RUN apk add --no-cache git
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY package.json .
RUN npm cache clean --force && \
    npm install --legacy-peer-deps --no-audit --no-fund
# Copy app files
COPY . .
# Expose port
EXPOSE 3002
# Start the app
CMD [ "node", "app.js" ]
