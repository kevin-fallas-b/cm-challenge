pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION=credentials('AWS_REGION')
    }
    stages {
        stage('Destroy existing EC2 Instance') {
            when { branch "main" }
            steps {
                dir ('terraform'){
                    sh 'terraform destroy --target aws_instance.nginx --auto-approve'
                }
            }
        }
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

        // This stage has to be executed to that ansible recognizes our config file when the terraform apply command 
        // Calls the ansible playbook. This is also so that we can keep the ansible config file isolated in its directory.
        stage('Copy Ansible config files'){
            when { branch "main" }
            steps{
                sh 'sudo mv ./ansible/ansible.cfg ./terraform'
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