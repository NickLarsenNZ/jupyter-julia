FROM nicklarsennz/jupyter-base:2.0.0

ENV JULIA_PATH /home/jupyter/julia
ENV PATH $JULIA_PATH/bin:$PATH

USER root

RUN apt update && \
    apt install -y curl && \
    rm -rf /var/lib/apt/lists/*

USER jupyter

RUN echo -v "Testing curl" && curl https://www.google.com
RUN curl -v -o julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.2/julia-1.2.0-linux-x86_64.tar.gz
RUN mkdir -p "$JULIA_PATH"
RUN file julia.tar.gz && ls -al julia.tar.gz
RUN tar -xzf julia.tar.gz -C "$JULIA_PATH" --strip-components 1
RUN rm julia.tar.gz

RUN julia --version && \
    julia -e 'using Pkg; Pkg.add("IJulia")'
