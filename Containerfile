FROM docker.io/debian:bookworm AS python-base
RUN rm /etc/apt/apt.conf.d/docker-clean
RUN --mount=type=cache,target=/var/cache apt-get update && apt-get -y install python3-pip
RUN rm /usr/lib/python3.11/EXTERNALLY-MANAGED 

FROM python-base
ENV ROCM_URL=https://download.pytorch.org/whl/rocm6.1
RUN pip3 install torch torchvision torchaudio --index-url "${ROCM_URL}"
