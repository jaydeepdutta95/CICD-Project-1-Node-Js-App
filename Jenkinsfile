pipeline {
    agent any
    stages{
        stage('Code'){
            steps{
                git url: 'https://github.com/jaydeepdutta95/CICD-Project-1-Node-Js-App.git', branch: 'main' 
            }
        }
        stage('Build and Test') { 
            agent { label 'agent1' 
            }
            steps{
                sh 'docker build . -t jaydeep007docker/my-node-app:latest'
            }
        }
        stage('Push') { 
            agent { label 'agent1' 
            }
            steps{
                withCredentials([usernamePassword(credentialsId: 'MyDockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                 sh 'docker push jaydeep007docker/my-node-app:latest'
                }
            }
        }
        stage('Deploy') { 
            agent { label 'agent1' 
            }
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
