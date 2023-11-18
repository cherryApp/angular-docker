FROM node
WORKDIR /app

COPY . .
RUN npm i -g @angular/cli
RUN cd ./frontend && npm i --legacy-peer-deps && ng build
RUN cd ./frontend/server && npm i
RUN cp ./frontend/dist/tables/* ./frontend/server/public

EXPOSE 3001

CMD [ "npm", "run", "express" ]
