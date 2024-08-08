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
                sh 'terraform --version' 
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: "${env.AZURE_CREDENTIALS_ID}", subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID', clientIdVariable: 'ARM_CLIENT_ID', clientSecretVariable: 'ARM_CLIENT_SECRET', tenantIdVariable: 'ARM_TENANT_ID')]) {
                    // Run Terraform Plan
                    sh '''
                    terraform plan \
                    -var "subscription_id=$ARM_SUBSCRIPTION_ID" \
                    -var "client_id=$ARM_CLIENT_ID" \
                    -var "client_secret=$ARM_CLIENT_SECRET" \
                    -var "tenant_id=$ARM_TENANT_ID"
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: "${env.AZURE_CREDENTIALS_ID}", subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID', clientIdVariable: 'ARM_CLIENT_ID', clientSecretVariable: 'ARM_CLIENT_SECRET', tenantIdVariable: 'ARM_TENANT_ID')]) {
                    // Apply Terraform changes
                    sh '''
                    terraform apply -auto-approve \
                    -var "subscription_id=$ARM_SUBSCRIPTION_ID" \
                    -var "client_id=$ARM_CLIENT_ID" \
                    -var "client_secret=$ARM_CLIENT_SECRET" \
                    -var "tenant_id=$ARM_TENANT_ID"
                    '''
                }
            }
        }
    }
}