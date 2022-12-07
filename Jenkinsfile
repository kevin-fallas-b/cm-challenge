pipeline {
    agent any
    stages {
        stage('Execute terraform init') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    bat 'terraform init' 
                }
            }
        }
         stage('Generate terraform graph') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    bat 'terraform graph | dot -Tsvg > graph.svgt'
                }
            }
        }
         stage('Execute terraform plan') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    bat 'terraform plan'
                }
            }
        }
        stage('Execute terraform apply') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    bat 'terraform apply --auto-approve'
                }
            }
        }
    }
}