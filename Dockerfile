
ARG ALPINE_VERSION=3.13

FROM elixir:1.11-alpine as elixir_alpine

RUN apk add --update-cache postgresql-client build-base
RUN apk add --no-cache file
RUN apk --update add imagemagick

RUN mix do local.hex --force, local.rebar --force

WORKDIR /app

COPY . .

FROM elixir_alpine AS development

RUN mix do deps.get, compile

RUN ["chmod", "+x", "./entrypoint.sh"]
ENTRYPOINT ["sh", "./entrypoint.sh"]

# Building a release version
FROM elixir_alpine AS build

ENV MIX_ENV=prod

RUN mix do deps.get, deps.compile

RUN mix phx.digest

RUN mix do compile, release

# prepare release image
FROM alpine:${ALPINE_VERSION} AS app

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="nordyvlasman/mijncmd"
LABEL org.label-schema.description="Mijncmd Application"
LABEL org.label-schema.vcs-url="https://github.com/nordyvlasman/mijncmd-backend"
LABEL org.label-schema.docker.cmd="docker run -d --name mijncmd -p 127.0.0.1:80:4000 -e DATABASE_HOST=\"...\" -e DATABASE_PORT=\"5432\" -e DATABASE_NAME=\"mijncmd_prod\" -e DATABASE_USER=\"mijncmd_db_user\" -e DATABASE_USER_PASSWORD=\"mijncmd_db_user_password\" -e SECRET_KEY_BASE=\"generate_your_own_secret_key_base_and_save_it\" -e URL_HOST=\"your_domain_to_mijncmd\" ghcr.io/nordyvlasman/mijncmd"
LABEL org.opencontainers.image.source="https://github.com/nordyvlasman/mijncmd-backend"
LABEL maintainer="hallo@nordyvlasman.nl"

RUN apk add --no-cache openssl ncurses-libs postgresql-client file imagemagick build-base

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY entrypoint.release.sh /app/entrypoint.release.sh
COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/mijncmd ./

ENV HOME=/app

ENTRYPOINT ["sh", "./entrypoint.release.sh"]
