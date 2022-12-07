pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION=credentials('AWS_REGION')
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
        stage('Capture Inventory') {
            steps {
                dir ('terraform'){
                    sh 'terraform output'

                    sh '''printf \\
                    "\\n$(terraform output -json instance_ips | jq -r \'.[]\')" \\
                    >> aws_hosts'''

                    sh 'echo aws_hosts'
                }
            }
        }
        stage('Run ansible') {
            steps {
                ansiblePlaybook(vaultCredentialsId : 'Challenge-proyecto.pem', inventory: 'aws_hosts', playbook: 'ansible/install-nginx.yaml')
            }
        }
    }
}