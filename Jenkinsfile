pipeline {
    agent any
    
    stages {

        stage('CLEAN_WORKSPACE') {
            steps {
               cleanWs()
            }
        }
        
        stage('Clone') {
            steps {
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {
                    git branch: 'main', url: "https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
                }
            }     
        }
        stage("AWS_Demo"){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                credentialsId: 'AWS_TOKEN',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){
                    sh "aws ec2 describe-instances --region=eu-central-1"
                }
                
            }
        }
        
    }
}