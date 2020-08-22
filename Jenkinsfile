pipeline {
    agent any
        environment {
         PROJECT_ID = '	poc-sed-shared-jetstream-sb'
         LOCATION = 'us-central1-c'
         CREDENTIALS_ID = 'poc-sed-shared-jetstream-sb'
         }
    stages {
	    stage('Terraform Init') {
          steps {
          sh "terraform init -input=false"
           }
      }
        stage('Terraform Plan') {
          steps {
          sh "terraform plan -out=tfplan -input=false"
                }
         }
        stage('Terraform Apply') {
          steps {
          input 'Apply Plan'
          sh "terraform apply -input=false tfplan"
             }
        } 
    }
}
