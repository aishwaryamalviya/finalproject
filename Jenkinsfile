pipeline {
    agent any
    options {
        buildDiscarder logRotator(daysToKeepStr: '5', numToKeepStr: '10')
    }
     environment {
        registryName = "aishacr"
        registryCredential = 'acr'
        dockerImage = ''
        registryUrl = 'aishacr.azurecr.io'
    }
    stages {
        stage('Compile and Clean') { 
            steps {

                sh "mvn -f clean compile"
            }
        }
        stage('deploy') { 
            steps {
                sh "mvn -f package"
            }
        }
        stage('SonarQube analysis')  {
            steps {
                 withSonarQubeEnv('sonarqube-8.9.6') {
                   sh 'mvn -f my-app/pom.xml sonar:sonar'
                 }
           }
        }
        stage ('Build Docker image') {
            steps {
                
                script {
                    dockerImage = docker.build registryName
                }
            }
        }
       
  
        stage('Upload Image to ACR') {
            steps{   
                script {
                    docker.withRegistry( "http://${registryUrl}", registryCredential ) {
                    dockerImage.push()
                    }
               }
           }
       }
    }
}
