FROM debian:13

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl build-essential git \
    python3 python3-pip python3-dev nodejs npm \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN pip3 install --no-cache-dir --break-system-packages flask numpy matplotlib

RUN useradd -m coder
USER coder
WORKDIR /home/coder/workspace

EXPOSE 8080
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "."]
