node {

	def application = "myapplicaiton"

	def dockerhubaccountid = "sumitkiit"

	stage('Clone repository') {

		checkout scm

	}



	stage('Build image') {

		app = docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")

	}



	stage('Push image') {

		withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
		app.push()

		app.push("latest")

	}

	}



	stage('Deploy') {

		dudo sh ("docker run -d -p 81:80  ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")

	}

	

	stage('Remove old images') {

		// remove docker old images

		sudo sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")

   }

}
