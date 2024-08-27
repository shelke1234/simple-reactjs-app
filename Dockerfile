FROM node:12.2.0-alpine
COPY . .
RUN npm install -g create-react-app
RUN npm install
EXPOSE 3000
CMD ["npm","start"]
