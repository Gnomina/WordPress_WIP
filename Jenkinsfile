pipeline {
    agent any
    
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







        
    }
}