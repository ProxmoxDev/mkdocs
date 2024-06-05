FROM python:3.9-alpine AS base
WORKDIR /docs
RUN pip3 install mkdocs mkdocs-material

FROM base AS dev

FROM nginx:alpine3.19-perl AS production
COPY --from=builder /docs/site /usr/share/nginx/html
EXPOSE 80