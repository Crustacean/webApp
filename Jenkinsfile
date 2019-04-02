node{
	stage('SCM Checkout'){
	git credentialsId: '704e8946-62cb-463c-b0ad-c03bf5b21039', url: 'https://github.com/Crustacean/webApp.git'
	echo "Code pulled successfully from Github"
	}
	stage('mvn package'){
	def mvnHome = tool name: 'M3', type: 'maven'
	def mvnCMD = "${mvnHome}/bin/mvn"
	bat "${mvnCMD} clean install"
	bat "${mvnCMD} clean package"
	echo "Build is successfull"
	}
	stage('Build Docker image'){
	bat "docker build -t em22435/testdeploy:1.0.${BUILD_NUMBER} ."
	echo "Package containerized successfully"
	}
	stage('Push Docker image'){
	withCredentials([string(credentialsId: 'dockerLogin', variable: 'dockerPwd')]) {
	bat "docker login --username em22435 --password ${dockerPwd}"
	}
	bat "docker push em22435/testdeploy:1.0.${BUILD_NUMBER}"
	}
}

// Kill Agent
// Input Step
//timeout(time: 15, unit: "SECONDS") {
    //input message: 'Do you want to approve the deploy in production?'
//}

node{
	stage('Run Container on Dev Env'){
	bat "docker run --rm -p 9180:8080 em22435/testdeploy:1.0.${BUILD_NUMBER}"
	}
}