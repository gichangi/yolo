FROM   node:13.12.0-alpine as build
# Set working directory
WORKDIR /app
ENV CI=true

COPY ./package*.json ./
RUN npm cache clean --force
# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build app
RUN npm install
# Expose the listening port
#EXPOSE 3000

# Launch app with PM2
#CMD [ "npm", "run", "build" ]
RUN npm run build

FROM nginx:alpine
ENV CI=true
# ## Replace the default nginx index page with our Angular app
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build  /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
RUN chown nginx:nginx /usr/share/nginx/html/*
ENTRYPOINT ["nginx", "-g", "daemon off;"]