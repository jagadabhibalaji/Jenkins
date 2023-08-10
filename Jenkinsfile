// pipeline{
//     agent any
//     options{
//         buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
//         timestamps()
//     }
//     environment{
//         registry = "jagadabhibalaji/jenkins"
//         registryCredential = 'd2178b8a-9560-487b-a87f-41cd89a90082'
//         DOCKER_USERNAME = 'jagadabhibalaji'
//         DOCKER_PASSWORD = 'Balu@3303'
//     }
//     stages{
//         stage('Building image') {
//             steps {
//                 script {
//                     dockerImage = docker.build registry + ":$BUILD_NUMBER"
//                 }
//             }
//         }
//         stage('Deploy Image') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId:registryCredential, usernameVariable: DOCKER_USERNAME, passwordVariable: DOCKER_PASSWORD)]) {
//                     script {
//                         docker.withRegistry('', DOCKER_USERNAME, DOCKER_PASSWORD) {
//                             dockerImage.push()
//                         }
//                     }
//                 }
//             }
//         }
//    }
// }


pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "https://index.docker.io/v1/"
        DOCKER_IMAGE_NAME = "jagadabhibalaji/jenkins"
    }
    
    stages {
        stage('Build Image') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Deploy Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "d2178b8a-9560-487b-a87f-41cd89a90082") {
                        def dockerImage = docker.image("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}

