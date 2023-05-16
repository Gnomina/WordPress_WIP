pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'vagrant_git', passwordVariable: 'pass', usernameVariable: 'user')]) {
                     git branch: 'main', url: 'https://github.com/Gnomina/wordpress.git'
                    }
               
            }     
        }
    }
}