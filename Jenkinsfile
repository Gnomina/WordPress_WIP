pipeline {
    agent any
    environment {
        AWS_CREDENTIALS = credentials('AWS_TF_KEY')
        AWS_ACCESS_KEY_ID = "${AWS_CREDENTIALS.username}"
        AWS_SECRET_ACCESS_KEY = "${AWS_CREDENTIALS.password}"
    }    
    stages {
        stage('CLEAN_WORKSPACE') { // Очистка рабочей директории в начале работы па плайна.
            steps {
               cleanWs()
            }
        }
        
        stage('Clone') {
            steps {//добавляем токен, клонируем репу из бранчи main, печатаем место хранения репозитория на сервере
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {
                    git branch: 'main', url: "https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
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
        stage('Terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
                echo 'ok'
            }
        }







        
    }
}