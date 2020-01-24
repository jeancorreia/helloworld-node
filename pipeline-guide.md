# Guia de passos do Pipeline

```
# 1 - Baixando o fonte
git pull

# 2 - Build Imagem Docker + App
sudo docker build -t registry.mylab.local:32000/hello-world:<version> .

# 3 - Marcar TAG do Build para Latest
docker tag <id_imagem> registry.mylab.local:32000/hello-world

# 4 - Push da imagem para o registry repo
docker push registry.mylab.local:32000/hello-world:latest








``` 
