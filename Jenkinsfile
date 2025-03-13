pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/sarfaraz017/AWS_Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t AWS_Project:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'sarfaraz017', url: '']) {
                    sh 'docker tag AWS_Project:latest sarfaraz017/AWS_Project:latest'
                    sh 'docker push sarfaraz017/AWS_Project:latest'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook -i /etc/ansible/hosts deploy.yml'
            }
        }
    }
}

