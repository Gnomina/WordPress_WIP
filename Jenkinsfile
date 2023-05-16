pipeline {
    agent any
    
    stages {
        stage('Clone') {
      // Clones the repository from the current branch name
            steps {
                git branch: main, credentialsId: "45172d7c-aca7-4265-97d7-84fb6469d07a", url: "https://github.com/Gnomina/WordPress_WIP.git"
            }     
        }
    }
}