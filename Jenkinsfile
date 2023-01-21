pipeline{
    agent any
    
    environment{
        registry = "jaydeep007docker/demo-apps"
        registryCredential = 'c468ea58-6880-4e27-8190-5efb7f1dd07f'        
               }
    
    stages{
       stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
       stage('Deploy Image') {
      steps{
            script {
              docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
                  }
            }        
      }
    }
  }
}