FROM ubuntu:22.04

RUN apt-get update && \
	apt-get install -y python3 python3-pip python3-venv && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /dev_config

COPY ./config .

RUN . ./script.sh

CMD ["bash"]
