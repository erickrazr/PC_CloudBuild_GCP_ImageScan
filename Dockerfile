FROM node:12
USER node
EXPOSE 8080
CMD [ "npm", "start" ]
