# Implementation Reasons
# Choice of the base image on which to build each container
- provided a basic packages required to run the app and light 


# Dockerfile directives used in the creation and running of each container.
- FROM 
- WORKDIR
- COPY
- RUN
- COPY 
- EXPOSE
- CMD


# Docker-compose Networking (Application port allocation and a bridge network implementation) where necessary.
- Created a single bridge network to connect both client and backend
- networks:
  - ip2-net:


# Docker-compose volume definition and usage (where necessary).
- volumes:
  backend_vol: volume required for backend app



# Git workflow used to achieve the task.
- used centralized git workflow


# Successful running of the applications and if not, debugging measures applied.
- Application was able to run successfully when provided credentails on backend/.env


# Good practices such as Docker image tag naming standards for ease of identification of images and containers. 
- Implemented semantic versioning on images ip2_backend_image:1.0.0 and ip2_client_image:1.0.0