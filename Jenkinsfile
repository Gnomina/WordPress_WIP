pipeline {
    agent any
    
    stages {

        stage('CLEAN_WORKSPACE') {
            steps {
               cleanWs()
            }
        }
        stage('Clone_Github_repo') {
            steps {
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {
                    git branch: 'add_aws_cred_terraform_test', url: "https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
                }
            }  
        }
        stage('Repo name'){
            steps{
                sh "git rev-parse --abbrev-ref HEAD > branche_name.txt"
            }   
        }

        stage("AWS_Terraform"){
            stages{
                stage("Terraform_Init"){
                    steps{
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                        credentialsId: 'AWS_TOKEN',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){
                            sh 'terraform init'
                            echo 'ok'
                         }
                    }
                } 
                stage("Terraform_Plan"){
                    steps{
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                        credentialsId: 'AWS_TOKEN',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){
                            sh 'terraform plan'
                            echo 'ok'
                         }
                    }
                } 
                stage("Terraform_apply"){
                    steps{
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                        credentialsId: 'AWS_TOKEN',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){
                            sh 'terraform apply -auto-approve'
                            echo 'ok'
                         }
                    }
                } 
                stage("Instance_ip_save"){
                    steps{  
                        sh 'terraform output instance_public_ip > public_ip.txt'

                    }   
                } 
            }
        }
    }
}