FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/techgaun/active-forks.git && \
    cd active-forks && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM pierrezemb/gostatic

COPY --from=base /git/active-forks /srv/http
EXPOSE 8043
