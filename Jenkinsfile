pipeline {
    agent any

    stages {
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
}      
