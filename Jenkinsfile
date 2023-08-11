pipeline {
    agent any
    environment {
        registry = "jagadabhibalaji/jenkins1"
        registryCredential = 'd2178b8a-9560-487b-a87f-41cd89a90082'
        dockerImage = ''
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/jagadabhibalaji/jenkins.git']]])
            }
        }
        
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        
        stage('Upload Image') {
            steps {     
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }  
        }
        
        stage('Docker Run') {
            steps {
                script {
                    bat "docker run %registry%"
                }
            }
        }
    }
}


// pipeline {
//     agent any

//     environment {
//         DOCKER_REGISTRY = "https://index.docker.io/v1/"
//         DOCKER_IMAGE_NAME = "jagadabhibalaji/jenkins1"
//         WORKSPACE_PATH = pwd()
//     }

//     stages {
//         stage('Build Image') {
//             steps {
//                 script {
//                     def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
//                 }
//             }
//         }

//         stage('Deploy Image') {
//             steps {
//                 script {
//                     docker.withRegistry("${DOCKER_REGISTRY}", "d2178b8a-9560-487b-a87f-41cd89a90082") {
//                         def dockerImage = docker.image("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
//                         dockerImage.push()
//                     }
//                 }
//             }
//         }

//         stage('Run Image') {
//             steps {
//                 script {
//                     def dockerImage = docker.image("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}")
//                     runDockerContainer(dockerImage)
//                 }
//             }
//         }
//     }
// }
// def runDockerContainer(dockerImage) {
//     dockerImage.inside('-w /C:/Users/JagadabhiBalaji-3303/.jenkins/workspace/mydocker') {
//         sh 'npm install' // Install any required dependencies
//         sh 'npm run build' // Build your project (replace with your build command)
//         sh 'npm start' // Start your application (replace with your start command)
//     }
}
