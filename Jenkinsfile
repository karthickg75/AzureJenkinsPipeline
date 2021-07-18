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
                git clone https://github.com/karthickg75/AzureJenkinsPipeline.git C:\JenkinsRepo
            }
        }
  
        stage('terraform init'){
            steps{
                sh 'C:\JenkinsRepo\terraform -chdir=azure\ init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'C:\JenkinsRepo\terraform -chdir=azure/ plan'
            }
        }
        
        
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
