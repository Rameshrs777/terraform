 pipeline {
    agent {
        node {
            label 'master'
        }
     }
   }
   stages {
       stage('terrform version') {
           steps {
               
               sh 'terraform -v'
           }
       }
       stage('checkout repo') {
           steps {
               git branch: "master",
               
               url: 'https://github.com/Rameshrs777/terraform.git'
               
           }
       }
       stage('Install Terraform') {
             steps {
                   sh "sudo yum install wget zip -y"
                   sh "cd /tmp"
                   sh "curl -o terraform.zip https://releases.hashicorp.com/terraform/'$terraform_version'/terraform_'$terraform_version'_linux_amd64.zip"
                   sh "unzip terraform.zip"
                   sh "sudo mv terraform /usr/bin"
                   sh "rm -rf terraform.zip"
                   sh "terraform version"
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
   }
}
