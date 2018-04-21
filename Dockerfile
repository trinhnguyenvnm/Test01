FROM node:8-onbuild
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm cache clean
RUN npm install
COPY . /usr/src/app
EXPOSE 4200
# CMD ["npm", "start"]

# use a node base image
# FROM node:8-onbuild

# # set maintainer
# LABEL maintainer "trinh@trinhnguyen.com"

# # set a health check
# HEALTHCHECK --interval=5s \
#             --timeout=5s \
#             CMD curl -f http://localhost:4200 || exit 1

# # tell docker what port to expose
# EXPOSE 4200

# CMD [ "ng", "serve" ]

