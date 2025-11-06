# Stage 1: Build (no separate dev stage kept – compose prod only)
FROM node:22-alpine AS builder
WORKDIR /app

# Install deps (use clean layer for better caching)
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy full source AFTER deps for better cache utilization
COPY . .
RUN npm run build

# Stage 2: Production runner
FROM node:22-alpine AS prod
WORKDIR /app

# Copy only the built app and production deps
COPY --from=builder /app/package*.json ./
RUN npm install --omit=dev --legacy-peer-deps

COPY --from=builder /app/build ./build

EXPOSE 3000

CMD ["node", "build"]
