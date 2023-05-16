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
                git credentialsId: 'vagrant_git', url: 'https://github.com/Gnomina/wordpress.git'
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