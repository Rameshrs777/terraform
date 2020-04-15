pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'sudo rm -r *;sudo git clone https://github.com/Rameshrs777/terraform.git'
            }
        }
    }
       stage(‘Set Terraform path’) {
           steps {
               script {
                   def tfHome = tool name: ‘Terraform’
                   env.PATH = “${tfHome}:${env.PATH}”
                       }
               sh ‘terraform — version’ 
                 }
             }
 
      stage(‘Provision infrastructure’) {
          steps {
            dir(‘dev’)
                  {
            sh ‘terraform init’
            sh ‘terraform plan -out=plan’
 // sh ‘terraform destroy -auto-approve’
 sh ‘terraform apply plan’
            }
        }
     }
 }
