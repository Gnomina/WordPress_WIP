pipeline {
    agent any
    
    stages {
        
        stage('Clone') {
            steps {
                cleanWs()
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {
                    sh "git clone https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
                }
            }     
        }







        stage('CLEAN_WORKSPACE') {
            steps {
               cleanWs()
            }
        }
    }
}