# Base Image: node:20-alpine
FROM node:20-alpine as base
RUN echo "Preparing Base Container..."

ENV NPM_HOME="/.npm"
ENV PATH="$NPM_HOME:$PATH"
RUN npm --version
WORKDIR /usr/src/app

COPY --chown=node:node package.json ./
COPY --chown=node:node package-lock.json ./

# Install npm packages
FROM base as development-build
RUN echo "Building Development Target..."
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

# RUN --mount=type=cache,id=npm,target=/npm/store npm ci
RUN npm ci
COPY --chown=node:node . .

RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache

USER node

# Build the application
FROM base as production-build
RUN echo "Building Production Target..."
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

COPY --chown=node:node --from=development-build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .

RUN npm run build --configuration=production

USER node

# Serve the application
FROM base as production
RUN echo "Building Production Target..."
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

COPY --chown=node:node --from=production-build /usr/src/app/dist/angular-ssr-azure ./dist/angular-ssr-azure
CMD [ "node", "dist/angular-ssr-azure/server/server.mjs" ]
