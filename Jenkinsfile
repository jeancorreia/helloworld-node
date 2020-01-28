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
                      sh 'docker build -t registry.mylab.local:32000/hello-world:${BUILD_NUMBER} .'
                      sh 'docker tag registry.mylab.local:32000/hello-world:${BUILD_NUMBER} registry.mylab.local:32000/hello-world:latest'
                }
           }

           stage('Uploading da Imagem para o Registry Container') {
                steps {
                      sh 'docker push registry.mylab.local:32000/hello-world:latest'
                }
           }

           stage('Piramide de Teste') {
               steps {
                     sh 'echo Piramide de Teste'
               }
           }
 
           stage('Deployment') {
               steps {
                     sh '''sed -i "s/^\\(\\s*value\\s*:\\s*\\).*/\\1v${BUILD_NUMBER}/" iac/kubernetes.yml'''
                     sh "kubectl kubectl --as='jenkins' apply -f iac/kubernetes.yml"
               }
           }
    } 
}
