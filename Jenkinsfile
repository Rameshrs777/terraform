 pipeline {
     agent 
         node {
              label 'master'
         } 
   }
   stages {
       stage('terrform version') {
           steps {
               
               sh 'terraform -v'
           }
       }
       stage('git clone') {
           steps {
               sh git clone 'https://github.com/Rameshrs777/terraform.git'
               
           }
       }
       stage('Install Terraform') {
             steps {
                   sh "sudo yum install wget unzip -y"
                   sh "sudo yum install wget -y"
                   sh "wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip"
                   sh "sudo unzip ./terraform_0.12.24_linux_amd64.zip -d /usr/local/bin/"
                   sh "terraform -v"
             }
       }
       stage('terraform init') {
           steps {
               sh  """
                   pwd;ls;
                   terraform init .
                   """
           }
       }
       stage('terraform plan') {
           steps {
               sh  """
                   terraform plan .
                   ls -l .
                   """
                script {
                   timeout(time: 10, unit: 'MINUTES') {
                      input(id: "Deploy Gate", message: "Deploy ${params.project_name}?", ok: 'Deploy')
                   }
               }
           }
       }
       stage('terraform apply') {
           steps {
               sh  """
                   terraform apply  -auto-approve .
                   """
           }
       }
       stage('Want to Destroy Resources??')  {  
           steps {
               script {
                  timeout(time: 10, unit: 'MINUTES') {
                     input(id: "Deploy Gate", message: "Want to Destroy ${params.project_name}?", ok: 'Destroy??')
                  }
               }
           }
       }
       stage('terraform destroy') {
           steps {
               sh  """
                   terraform destroy -auto-approve .
                   """
           }
       }
