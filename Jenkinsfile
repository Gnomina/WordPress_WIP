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
                    sh 'git rev-list --no-walk 640d3279b3a9fc5c5f52e500ed316944347f32c9'
                    //"comm ${commit}"
                    
                }
            }  
        }
        stage("Extract Last Commit") {
            steps {
                script {
                def lastCommitHash = sh(script: 'git rev-parse refs/remotes/origin/terraform_update^{commit}', returnStdout: true).trim()
                def commitMessage = sh(script: "git log --format=%B -n 1 ${lastCommitHash}", returnStdout: true).trim()
                def commitAuthor = sh(script: "git log --format=%an -n 1 ${lastCommitHash}", returnStdout: true).trim()
                def commitTimestamp = sh(script: "git log --format=%at -n 1 ${lastCommitHash}", returnStdout: true).trim()

                echo "Last Commit Hash: ${lastCommitHash}"
                echo "Commit Message: ${commitMessage}"
                echo "Commit Author: ${commitAuthor}"
                echo "Commit Timestamp: ${commitTimestamp}"
            }
        }
    }
    stage("Extract Branch and Commit") {
        steps {
            script {
                def gitBranchOutput = sh(script: 'git branch -a -v --no-abbrev', returnStdout: true).trim()
      
      // Extract the branch and commit information using regular expressions
                def branchMatch = (gitBranchOutput =~ /\* (\S+)\s+([0-9a-f]+)\s+(.+)/)
                def branchName = branchMatch[0][1]
                def commitMessage = branchMatch[0][3]
      
      // Format the output
               def formattedOutput = "branch:${branchName},commit:${commitMessage}"
      
               echo formattedOutput
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