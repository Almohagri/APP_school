# ==== Stage 1: Build the flutter web app ====
FROM cirrusci/flutter:stable AS build

WORKDIR /app

# Copy pubspec files and get dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the project files
COPY . .

# Build the web release
RUN flutter build web

# ==== Stage 2: Serve the app with a simple web server ====
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built web assets from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
