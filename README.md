# docker-restler-fuzzer
A Dockerised version of Microsoft's RESTler-fuzzer (https://github.com/microsoft/restler-fuzzer)

## To build

`$ docker build -t restler-fuzzer`

## To run

### To compile a Swagger file into a grammar for RESTler-fuzzer to consume

First move your Swagger file into `$(pwd)/swagger` and create an empty directory `$(pwd)/Compile`, then

`$ docker run -v $(pwd)/swagger:/swagger -v $(pwd)/Compile:/Compile restler-fuzzer:latest`

After this, you should have the following files `$(pwd)/Compile/grammar.py`, `$(pwd)/Compile/dict.json`, `$(pwd)/Compile/engine_settings.json`.

You'll need these files to run a fuzz test

### To run a fuzz test after compilation

Ensure you have `grammar.py`, `dict.json` and `engine_settings.json` files in the `$(pwd)/Compile` directory from running the previous compilation step.

Assuming you want to run a fuzz test for 0.05 hours (3 minutes), and the target for the test is at http://192.168.0.1:8080

`$ docker run -v $(pwd)/Compile:/Compile -v $(pwd)/Fuzz:/Fuzz -e TIMEBUDGET=0.05 -e TARGET_IP=192.168.0.1 -e TARGET_PORT=8080 restler-fuzzer:latest`
