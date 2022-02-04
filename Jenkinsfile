pipeline {
  environment {
    imagename = "adithyak21/jenkins-docker"
    registryCredential = 'adithyak21'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/adithyak21/simple-docker.git', branch: 'main'])
      }
    }
    stage('Building image') {
      steps{
        script {
          sh """
          curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
          """
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
      }
    }
  }
}
