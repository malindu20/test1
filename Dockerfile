# Author: Mahara Mahara
# Data: 09/02/2024

# Q1 - Use the Node.js 19.7.0-alpine base image
FROM node:19.7-alpine

# Q2 - Set the default Node environment to production
ENV NODE_ENV production

# Q3 - Create a new directory named 'labone' in the root
RUN mkdir /labone

# Q3.1 - Change ownership of the 'labone' directory to the 'node' user and group
RUN chown -R node:node /labone

# Q3.2 - Set the 'labone' directory as the working directory
WORKDIR /labone

# Q4 - Set the user to 'node'
USER node

# Q5 - Copy all source files to the 'labone' directory and adjust file ownership
COPY --chown=node:node . /labone

# Q6 - Run npm install to install Node.js packages
RUN npm install

# Q7 - Expose port 3000
EXPOSE 3000

# Q8 - Set the default execution command for the container
CMD ["node", "src/index.js"]
