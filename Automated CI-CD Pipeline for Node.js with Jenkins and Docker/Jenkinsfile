pipeline {
    agent any

    stages {
        stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main',  url: 'https://github.com/Alien166/Dockerizing-React-App-Project.git'
            }
        }
        stage('CI') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        docker build . -f dockerfile -t toba44/react-iti.10
                        docker login -u ${USERNAME} -p ${PASSWORD}
                        docker push toba44/react-iti.10
                    """
                }
            }
        }
        stage('CD') {
            steps {
                sh """
                    docker run -d -p 3000:3000 toba44/react-iti.10
                """
            }
        }
    }

    post {
        success {
            slackSend(channel: 'jenkins', message: "Pipeline '${env.JOB_NAME}' (${env.BUILD_NUMBER}) completed successfully! :tada:\nBuild URL: ${env.BUILD_URL}")
        }
        failure {
            slackSend(channel: 'jenkins', message: "Pipeline '${env.JOB_NAME}' (${env.BUILD_NUMBER}) failed. :x:\nBuild URL: ${env.BUILD_URL}")
        }
    }
}
