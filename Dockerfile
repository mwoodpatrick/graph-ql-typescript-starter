FROM node:15.10.0-alpine
# Env
ENV ENV_NAME dev
# Create Directory for the Container
WORKDIR /usr/src/app
# Only copy the package.json file to work directory
COPY package.json .
# Install all Packages
RUN npm install
# Copy all other source code to work directory
ADD src ./src
ADD lib ./lib
ADD	tsconfig.json .
# TypeScript
RUN npm run build
# Start
CMD [ "npm", "start" ]
EXPOSE 4000