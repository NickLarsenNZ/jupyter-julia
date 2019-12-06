# `nicklarsennz/jupyter-julia`

_Jupyter Lab with Julia kernel_

Example run:
```sh
docker run --rm -v $HOME/notebooks:/data:rw -p 8999:8080 -e EXTERNAL_PORT=8999 nicklarsennz/jupyter-julia:latest
```

## Extend this image

```Dockerfile
FROM nicklarsennz/jupyter-julia:latest

# Add additional packages
RUN julia -e 'using Pkg; Pkg.add("PyPlot")'
```

## Environment

| Variable | Default | Purpose |
| --- | --- | --- |
| EXTERNAL_HOST | localhost | Jupyter will print a URL for this host to stdout |
| EXTERNAL_PORT | 8080 | Jupyter will print a URL with this port to stdout |

## Additional Info

- Comes with Python 3.7
- Jupyer [Security Disabled][config] **Intended for local use**
- The image runs as user `jupyter`
- Working Directory: `/home/jupyter`
- Notebooks Directory: `/data/` (Mount your notebooks folder here)

[config]: ./config.py
