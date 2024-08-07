pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('azure_service_principal') // Azure service principal credentials
    }

    stages {
        stage('Initialize Terraform') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Validate Terraform') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean the workspace after the build
        }
    }
}
