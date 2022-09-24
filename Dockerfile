FROM node:16-alpine as build

WORKDIR /app

COPY . ./

# ---
FROM fholzer/nginx-brotli:v1.12.2

WORKDIR /etc/nginx
ADD nginx.conf /etc/nginx/nginx.conf

COPY --from=build build /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]