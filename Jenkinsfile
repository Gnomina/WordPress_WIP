pipeline {
    agent any
    
    stages {
        stage('Clean workspace') {
            steps {
               sh 'rm -rf ${WORKSPACE}*'

            }
        }
        stage('Clone') {
            steps {
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {
                    sh "git clone https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
                }
            }     
        }
    }
}