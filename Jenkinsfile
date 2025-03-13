pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sarfaraz017/aws_project:latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sarfaraz017/AWS_Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                        sh "docker login -u sarfaraz017 -p ${DOCKER_PASSWORD}"
                        sh "docker tag ${DOCKER_IMAGE} sarfaraz017/aws_project:latest"
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh "ansible-playbook -i /etc/ansible/hosts /var/lib/jenkins/workspace/AWS_Project/deploy.yml"
            }
        }
    }
}
