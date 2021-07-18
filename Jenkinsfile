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
                sh 'sudo rm -r *;sudo git clone https://github.com/deepan4cloud/azure.git'
                sh 'pwd'
            }
        }
  
        stage('terraform init'){
            steps{
                sh 'pwd'
                sh 'ls -al; sudo /usr/bin/terraform -chdir=azure/ init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./azure; sudo /usr/bin/terraform -chdir=azure/ plan'
            }
        }
        
        
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
