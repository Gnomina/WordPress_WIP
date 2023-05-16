pipeline {
    String branchName = env.BRANCH_NAME
    String gitCredentials = "45172d7c-aca7-4265-97d7-84fb6469d07a"
    String repoUrl = "https://github.com/Gnomina/WordPress_WIP.git"

    agent any

    stage('Clone') {
      // Clones the repository from the current branch name
      echo 'Make the output directory'
      sh 'mkdir -p build'

      echo 'Cloning files from (branch: "' + branchName + '" )'
      dir('build') {
          git branch: branchName, credentialsId: 	gitCredentials, url: repoUrl
      }     
  }
}