# Imagem Base
FROM node:latest

# Mantenedor
LABEL maintainer "jeancorreia@mylab.jcc"

EXPOSE 8080
COPY server.js .
CMD node server.js

# Porta/Socket Exposto para Conexao
EXPOSE 8000
