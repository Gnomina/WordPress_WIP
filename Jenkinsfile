pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {
                    sh "git clone https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                }
            }     
        }
    }
}