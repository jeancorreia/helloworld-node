pipeline {
    agent any
    stage('Downloading do codigo fonte no GIT') {
        checkout scm
    }
    stage('Build Imagem Docker + App') {
	steps {
              sh 'docker build -t registry.mylab.local:32000/hello-world:${env.BUILD_NUMBER} . >docker-build.log'
        }
    }
    stage('Testing a Lot') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-)
	*/
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
