FROM ghcr.io/linuxserver/baseimage-selkies:debiantrixie

ENV TITLE="Nicotine+"

# ---------------------------------------------------------
# Nicotine+ из репозитория Debian (GTK4, тянет python3-gi сам)
# ---------------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        nicotine \
        gir1.2-adw-1 \
        adwaita-icon-theme \
        fonts-dejavu-core \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------
# Selkies конфигурация
# ---------------------------------------------------------
COPY root /

EXPOSE 3001
VOLUME /config
