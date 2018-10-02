
node {
    def app

    stage('Download Source of GIT') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build App') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("getintodevops/hellonode")
    }

    stage('Test a Lot') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'grep node Dockerfile ; if [ $? -ne 0 ] ;then exit 1 ;fi'
        }
    }

    stage('build') {
        steps {
            sh  """
                # Some commands
                """
            script {
                timeout(time: 10, unit: 'MINUTES') {
                   input(id: "Deploy Gate", message: "Deploy ${params.project_name}?", ok: 'Deployment')
                }
            }
        }
    }

    stage('Deployment') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('http://10.203.178.113:5000', 'nexus-admin') {
            app.push("${env.BUILD_NUMBER}")
            app.push("dev")
        }
    }
}
