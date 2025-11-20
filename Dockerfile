# --- Build Stage ---
FROM node:20 AS build
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

# Copy custom nginx config from the current context
COPY nginx.conf /etc/nginx/conf.d/default.conf


# Copy built React files
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
