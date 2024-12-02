# Use a specific version of Alpine for consistency
FROM alpine:3.20.3

# Set metadata
LABEL maintainer="taufiqpsumarna@gmail.com"
LABEL description="Lightweight container with AWS CLI, kubectl, Helm, and essential tools for deploying apps into Kubernetes clusters."
LABEL version="1.0"

# Install dependencies and required tools
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    openssl \
    tar \
    unzip \
    wget \
    gnupg \
    lsb-release \
    ca-certificates \
    aws-cli \
    kubectl \
    helm && \
    # Clean up apk cache to minimize image size
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Verify installations
RUN aws --version && \
    kubectl version --client && \
    helm version

# Set default shell
CMD ["/bin/bash"]
