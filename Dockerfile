FROM mcr.microsoft.com/dotnet/sdk:5.0.203-buster-slim-amd64
ENV PYTHON_VERSION=3.8.2
RUN apt-get update && apt-get install -y unzip build-essential zlib1g-dev
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
RUN tar -zxvf Python-$PYTHON_VERSION.tgz
RUN cd Python-$PYTHON_VERSION && ./configure && make && make altinstall && ln -s /usr/local/bin/python3.8 /usr/local/bin/python && cd ..
RUN git clone https://github.com/microsoft/restler-fuzzer
RUN cd restler-fuzzer && mkdir bins && python3.8 ./build-restler.py --dest_dir ./bins
WORKDIR restler-fuzzer
RUN ls
RUN ls bins
