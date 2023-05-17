pipeline {
    agent any
    
    stages {
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