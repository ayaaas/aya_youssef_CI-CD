# Stage 1: Build Frontend
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build Backend
FROM node:18-alpine
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm install --production
COPY backend/ ./

# Copy frontend build to backend public directory
# Adjust the destination path based on where your Express app serves static files
COPY --from=frontend-build /app/frontend/build ./public

EXPOSE 3000
CMD ["npm", "start"]
