FROM node:21-alpine3.18 AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN pnpm run build
RUN mv .output/server/node_modules .output/server/node_modules_prod

FROM base AS web
WORKDIR /usr/app
COPY --from=build /usr/src/app/.output .
RUN mv ./server/node_modules_prod ./server/node_modules
EXPOSE 3000
CMD [ "node", "server/index.mjs" ]