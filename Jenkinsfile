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
                    sh 'git rev-parse refs/remotes/origin/terraform_update^{commit}'
                    sh 'git branch -a -v --no-abbrev'
                    sh 'git rev-list --no-walk'
                    //"comm ${commit}"
                    
                }
            }  
        }
      //  stage('Repo name'){
      //      steps{
      //          script {
      //              def branchName = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
      //              env.branch_name = branchName
      //          }
      //      }
      //  }
        

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