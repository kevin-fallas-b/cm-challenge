pipeline {
    agent any
    environment {
        AWS_SHARED_CREDENTIALS_FILE='/home/ubuntu/.aws/credentials'
    }
    stages {
        stage('Execute terraform init') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    sh 'terraform init' 
                }
            }
        }
         stage('Execute terraform plan') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    sh 'terraform plan'
                }
            }
        }
        stage('Execute terraform apply') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}