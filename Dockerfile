FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/techgaun/active-forks.git && \
    cd active-forks && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/active-forks .
