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
                    git branch: 'terraform_update', url: "https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"
                                       
                }
            }  
        }
        stage("Extract Branch and Commit") {
            steps {
                script {
                    def gitBranchOutput = sh(script: 'git branch -a -v --no-abbrev', returnStdout: true).trim()
                    def branchMatch = (gitBranchOutput =~ /\* (\S+)\s+([0-9a-f]+)\s+(.+)/)
                    def branchName = branchMatch[0][1]
                    def commitMessage = branchMatch[0][3]
                    env.branch_name = branchName
                    env.commit_Message = commitMessage
                    echo "branch:${branchName},commit:${commitMessage}"
                }
            }
        }

        
    

      
     //   stage("AWS_Terraform"){
     //       stages{
     //           stage("Terraform_Init"){
     //               steps{
     //                   withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
     //                   credentialsId: 'AWS_TOKEN',
     //                   accessKeyVariable: 'AWS_ACCESS_KEY_ID',
     //                   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){
     //                       dir("${WORKSPACE}") {
     //                           sh 'terraform init'
     //                           echo 'ok'
     //                       }
     //                    }
     //               }
     //          } 
     //            
     //       }
     //   }
    }
}