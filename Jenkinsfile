pipeline {
  environment {
    imagename = "prasanthmeduri/jenkins-docker"
    registryCredential = 'prasanthmeduri-docckerhub'
    dockerImage = ''
    repoUrl = 'https://github.com/prasanthghub/simple-docker.git'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/prasanthghub/simple-docker.git', branch: 'main'])
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build "prasanthmeduri/jenkins-docker"
        }
      }
    }
    stage('Running image') {
      steps{
        script {
          sh "docker run ${imagename}:latest"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
            sh """
            git tag -a ${BUILD_NUMBER} -m "build number ${BUILD_NUMBER}"
            git push ${repoUrl} ${BUILD_NUMBER}
            """
          }
        }
      }
    }
  }
}
