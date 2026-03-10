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
COPY --from=frontend-build /app/frontend/build ./public

# Set the port to 3000 so it matches the EXPOSE and your localhost attempt
ENV PORT=3000
EXPOSE 3000

CMD ["npm", "start"]
