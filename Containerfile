FROM docker.io/debian:bookworm AS python-base
#RUN rm /etc/apt/apt.conf.d/docker-clean
RUN --mount=type=cache,target=/var/cache apt-get update && apt-get -y install python3-pip git
RUN rm /usr/lib/python3.11/EXTERNALLY-MANAGED 

FROM python-base
RUN --mount=type=cache,target=/root/.cache pip --no-cache-dir install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.1
