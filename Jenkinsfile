pipeline {
    agent any
    stages {

           stage('Downloading do codigo fonte no GIT') {
                checkout scm
           }
 
           stage('Build Imagem Docker + App') {
                sh 'docker build -t registry.mylab.local:32000/hello-world:${env.BUILD_NUMBER} . >docker-build.log'
           }
 
           stage('Testing a Lot') {
           }
 
           stage('Deployment') {
           }
    } 
}
