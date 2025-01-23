FROM nginx AS builder

WORKDIR /app

RUN apt updae 

RUN apt install mkdocs -y && \
apt install mkdocs-material -y

COPY . .

RUN mkdocs build 

FROM nginx:alpine

COPY --from=builder /app/site /usr/share/nginx/html 
