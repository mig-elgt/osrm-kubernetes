FROM gcr.io/mig-elgt/osrm-fetcher:v4 as fetcher

FROM osrm/osrm-backend:v5.22.0
RUN apt-get update && apt-get install -y ca-certificates
RUN update-ca-certificates
COPY --from=fetcher /usr/local/bin/app /usr/local/bin/fetcher
RUN chmod +x /usr/local/bin/fetcher

EXPOSE 5000
