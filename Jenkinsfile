node {
    def app
    stage('Downloading Source from GIT') {
        /* Let's make sure we have the repository cloned to our 
workspace */
        checkout scm
    }
    
    stage('Building') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("getintodevops/hellonode")
    }
    stage('Testing a Lot') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) 
*/
        app.inside {
            sh 'grep node Dockerfile ; if [ $? -ne 0 ] ;then exit 1 ;fi'
        }
    }
    stage('Deployment') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. 
*/
        timeout(time:5, unit:'MINUTES') {
            input message:'Aprovar esse deployment?', submitter: 'admin'
        }
        docker.withRegistry('http://10.203.178.113:5000', 'nexus-admin') 
{
            app.push("${env.BUILD_NUMBER}")
            app.push("dev")
        }
    }
}
