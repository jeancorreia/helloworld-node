pipeline {
    agent any
    stages {
           stage('Downloading do codigo fonte no GIT') {
                steps {
                      checkout scm
                }
           }

           stage('Build Imagem Docker + App') {
                steps {
                      sh 'docker build -t registry.mylab.local:32000/hello-world:20 . >docker-build.log'
                }
           }

           stage('Testing a Lot') {
               steps {
                     sh 'echo Testing a Lot'
               }
           }
 
           stage('Deployment') {
               steps {
                     sh 'echo Deployment'
               }
           }
    } 
}
