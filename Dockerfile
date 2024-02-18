#Imagen base del proyecto y es una ver NODE_VERSION 21.6.2

FROM node:21-bookworm As base

# Actualizar

RUN apt-get update 

# para usar bcrypt  que ayuda a  hashing 
RUN apt-get install -y \
    build-essential \
    python3 \
    python3-dev \
    python3-pip \
    libssl-dev \
    libc6-dev \
    make \
    g++

ENV DIR /app

WORKDIR $DIR

#Sección de desarrollo
# Target
FROM base AS dev  

ENV NODE_ENV=development

COPY *.json $DIR

RUN npm install --quit --no-progress

COPY src $DIR/src

EXPOSE $PORT_NEST_CONTAINER

CMD ["npm" , "run", "debug"]











