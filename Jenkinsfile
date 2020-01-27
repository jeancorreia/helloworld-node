node {
    def app
    stage('Downloading do codigo fonte no GIT') {
        checkout scm
    }

    stage('Build Imagem Docker + App') {
	sh docker build -t registry.mylab.local:32000/hello-world:${env.BUILD_NUMBER} . >docker-build.log 
    }
    stage('Testing a Lot') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-)
	*/
    }
    stage('Deployment') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused.

        timeout(time:5, unit:'MINUTES') {
            input message:'Aprovar esse deployment?', submitter: 'admin'
        }
        docker.withRegistry('http://10.203.178.113:5000', 'nexus-admin')
        {
            app.push("${env.BUILD_NUMBER}")
            app.push("dev")
        } */
    }
}
