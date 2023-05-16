pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'User_pass', passwordVariable: 'pass', usernameVariable: 'user')]) {
                     git branch: 'main', url: 'https://github.com/Gnomina/wordpress.git'
                    }
               
            }     
        }
    }
}