pipeline {
    agent any
    
    stages {
        stage('Clone') {
      // Clones the repository from the current branch name
            steps {
                git credentialsId: "dce640b7-2144-4576-a1e2-9504538140ae", url: "https://github.com/Gnomina/WordPress_WIP.git"
            }     
        }
    }
}