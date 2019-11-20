FROM nicklarsennz/jupyter-base:2.0.0

ENV JULIA_PATH /home/jupyter/julia
ENV PATH $JULIA_PATH/bin:$PATH

USER root

RUN apt update && \
    apt install -y curl && \
    rm -rf /var/lib/apt/lists/*

USER jupyter

RUN curl -L -o julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.2/julia-1.2.0-linux-x86_64.tar.gz && \
    mkdir -p "$JULIA_PATH" && \
    tar -xzf julia.tar.gz -C "$JULIA_PATH" --strip-components 1 && \
	 rm julia.tar.gz

RUN julia --version && \
    julia -e 'using Pkg; Pkg.add("IJulia")'

