pipeline {
    agent any

    stages {
        stage('START') {
            steps {
                echo 'Start_Init'
            }
        }
        stage('Clean workspace') {
            steps {
               sh 'rm -rf /path/to/workspace/*'
            }
       }
        stage('Clone repo') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'e2f9973a-276b-45c7-bde0-9dd598a155e2', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
               git branch: 'main', url: 'https://github.com/Gnomina/wordpress.git'
               }
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
                echo 'ok'
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
                echo 'ok'
            }
        }
        
    }
}      
