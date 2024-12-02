# Use a specific version of Alpine for consistency
FROM alpine:3.20.3

# Set metadata
LABEL maintainer="taufiqpsumarna@gmail.com"
LABEL description="Lightweight container with AWS CLI, kubectl, Helm, and essential tools for deploying apps into Kubernetes clusters."

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
    ca-certificates && \

# Install AWS CLI
    apk add --no-cache aws-cli && \

# Install kubectl
    apk add --no-cache kubectl && \

# Install Helm
    apk add --no-cache helm

# Verify installations
RUN aws --version && \
    kubectl version --client --output=yaml \
    helm version

# Set default shell
CMD ["/bin/bash"]
