pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('azure_service_principal') // Azure service principal credentials
    }


    stages {
        // stage('Checkout') {
        //     steps {
        //         git url: 'https://github.com/Learnit06/AZ-Terraform.git', credentialsId: 'Github'
        //         sh 'ls' // Verify Git checkout

        //     }
        // }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan -var "client_id=$AZURE_CLIENT_ID" -var "client_secret=$AZURE_CLIENT_SECRET" -var "tenant_id=$AZURE_TENANT_ID" -var "subscription_id=$AZURE_SUBSCRIPTION_ID"'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
