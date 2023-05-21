pipeline {
    agent any
    
    stages {

        stage('CLEAN_WORKSPACE') {// Очистка рабочей директории.
            steps {
               cleanWs()// Очистка рабочей директории.
            }
        }
        
        stage('Clone_Github_repo') {// Клонирование репозитория.
            steps {
                //git credentialsId: 'vagrant_git', url: 'https://github.com/Gnomina/WordPress_WIP.git'
                withCredentials([string(credentialsId: 'vagrant_git', variable: 'token')]) {// Подключение к GitHub.
                    git branch: 'add-ansible', url: "https://Gnomina:${token}@github.com/Gnomina/WordPress_WIP.git"
                    echo "Клонированный репозиторий находится в папке: ${WORKSPACE}"//// Вывод пути к клонированному репозиторию.
                }
            }  
        }
        stage("Extract Branch and Commit") {// Извлечение ветки и коммита.
            steps {
                script {
                    def gitBranchOutput = sh(script: 'git branch -a -v --no-abbrev', returnStdout: true).trim()
                    def branchMatch = (gitBranchOutput =~ /\* (\S+)\s+([0-9a-f]+)\s+(.+)/)// Регулярное выражение для извлечения ветки и коммита.
                    def branchName = branchMatch[0][1]// Извлечение ветки.
                    def commitMessage = branchMatch[0][3]// Извлечение коммита.
                    env.branch_name = branchName// Переменная с веткой.
                    env.commit_Message = commitMessage// Переменная с коммитом.
                    echo "branch:${branchName},commit:${commitMessage}"// Вывод ветки и коммита.
                }
            }
        }
        stage("Ansible"){
            steps {
                ansiblePlaybook(
                    withCredentials([sshUserPrivateKey(credentialsId: '8e61ea52-e401-4218-87fe-330152500d72', keyFileVariable: 'SSH_KEY')]){
                        inventory: "${WORKSPACE}/hosts.ini"
                        playbook: "${WORKSPACE}/ansible/playbook.yml"
                    
                    }
                )
            }
        }




      
//        stage("AWS_Instance Creation"){ // Создание инстанса в AWS с помощью Terraform.
//            stages{
//                stage("Terraform_Init"){
//                    steps{
//                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',// Подключение к AWS.  
//                        credentialsId: 'AWS_TOKEN',// Используемый токен. 
//                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',// Переменная с токеном. 
//                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){// Переменная с секретным ключом. 
//                            dir("${WORKSPACE}") {// Переход в рабочую директорию.
//                                sh 'terraform init'// Инициализация Terraform.
//                                echo 'ok'// Вывод сообщения об успешной инициализации.
//                            }
//                         }
//                    }
//                } 
//                 
//            }
//        }
    }
}