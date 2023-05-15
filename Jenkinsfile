pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Terraform test'
            }
        }
        stage('Clean workspace') {
            steps {
               sh 'rm -rf /path/to/workspace/*'
            }
       }
        stage('Clone repo') {
            steps {
               git branch: 'main', url: 'https://github.com/Gnomina/wordpress.git'
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
        stage('Terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
                echo 'ok'
            }
        }
    }
}      
