FROM node:16.10-alpine as builder
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:1.21.6-alpine
COPY --from=builder /app/dist/ /usr/share/nginx/html

# RUN npm install && npm cache clean --force
# COPY . .
# EXPOSE 4200
# RUN ng serve

