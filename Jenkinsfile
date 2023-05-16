pipeline {
    agent any
    
    stages {
        stage('Clone') {
      // Clones the repository from the current branch name
            echo 'Make the output directory'
            sh 'mkdir -p build'

      
            dir('build') {
              git branch: branchName, credentialsId: "45172d7c-aca7-4265-97d7-84fb6469d07a", url: "https://github.com/Gnomina/WordPress_WIP.git"
      }     
  }
 }
}