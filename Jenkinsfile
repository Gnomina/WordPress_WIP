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
                    git branch: 'add_aws_cred_terraform_test', url: "https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
                }
            }     
        }
        stage("AWS_Demo"){


            environment {
                AWS_CREDENTIALS = credentials('AWS_TOKEN')
                AWS_ACCESS_KEY_ID = AWS_CREDENTIALS.accessKey
                AWS_SECRET_ACCESS_KEY = AWS_CREDENTIALS.secretKey
            }
            stages{
                stage("Terraform Init"){
                    steps{
                        withAWS(credentials: 'AWS_TOKEN'){
                            sh 'terraform init'
                            echo 'ok'
                        }
                    }
                }   
            }
        }
    }
}