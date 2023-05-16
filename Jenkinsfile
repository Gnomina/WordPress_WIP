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
                script {
                    def gitCredentials.id = credentials('45172d7c-aca7-4265-97d7-84fb6469d07a')
                    git credentialsId: gitCredentials.id, url: 'https://github.com/Gnomina/wordpress.git'
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