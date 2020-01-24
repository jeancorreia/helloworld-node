# Imagem Base
FROM node:latest

# Mantenedor
LABEL maintainer "jeancorreia@mylab.jcc"

EXPOSE 8080
COPY main.js .
CMD node main.js

# Porta/Socket Exposto para Conexao
EXPOSE 8000
