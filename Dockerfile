# --- Build Stage ---
FROM node:18 AS build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy React project files
COPY . .

# Build React app
RUN npm run build

# --- Production Stage ---
FROM nginx:alpine

# Replace default nginx config
COPY ../nginx.conf /etc/nginx/conf.d/default.conf

# Copy built React files
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
