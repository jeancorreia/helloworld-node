#!/bin/bash

echo $USER

echo 1 - Baixando o fonte
git pull

echo 2 - Build Imagem Docker + App
docker build -t registry.mylab.local:32000/hello-world:$1 . >docker-build.log
imagem_id=`cat docker-build.log |grep built | cut -f3 -d" "`

echo 3 - Marcar TAG do Build para Latest
docker tag $imagem_id registry.mylab.local:32000/hello-world

echo 4 - Push da imagem para o registry repo
docker push registry.mylab.local:32000/hello-world:latest

echo 5 - Ajuste variavel para a version do Build
sed -i "s/^\(\s*value\s*:\s*\).*/\1v$1/" iac/kubernetes.yml

echo 6 - Apply novo deployment
kubectl apply -f iac/kubernetes.yml


