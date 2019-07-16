FROM node:alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


# secretAccessKey = e27KPDUGXjG4IGKaGaTsxztaoE2357FTCTC7w1up
# accessKeyId =  AKIAWNNWYXTCIAHCLU6D