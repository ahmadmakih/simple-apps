FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
#COPY . .
#EXPOSE 3000
#CMD ["npm", "start"]

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["npm", "start"]

