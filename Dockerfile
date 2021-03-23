#############################################################
# PORTFOLIO APPLICATION
#############################################################

# Get the base Node.js image
FROM node:current

# RUN mkdir -p /usr/src/collab/server

# Create app directory
WORKDIR /app/portfolio/

# Copy over the package.js file
COPY package*.json ./app/portfolio/

# Install all the dependencies
RUN npm install
RUN npm install -g nodemon
# If you are building your code for production
# RUN npm ci --only=production

# Copy over all the app files
COPY . ./app/portfolio/

# Create an environment variable
ENV PORT=20000

# Start the Application
CMD ["npm", "run", "start"]

# RUN npm install -g nodemon
# Bundle app source
#COPY ./ ./usr/src/collab/server/

# Bind port 3000 to have it mapped by the docker daemon
EXPOSE 20000

## THE LIFE SAVER
# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
# RUN chmod +x /wait

## Launch the wait tool and then start the Node.js App
# CMD /wait && npm start


# Start the Node.js App
# CMD [ "node", "index.js" ]