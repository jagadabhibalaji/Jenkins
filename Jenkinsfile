pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        registry = "jagadabhibalaji/jenkins"
        registryCredential = 'd2178b8a-9560-487b-a87f-41cd89a90082'
        DOCKER_USERNAME = 'jagadabhibalaji'
        DOCKER_PASSWORD = 'Balu@3303'
    }
    stages{
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        // stage('Deploy Image') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId:registryCredential, usernameVariable: DOCKER_USERNAME, passwordVariable: DOCKER_PASSWORD)]) {
        //             script {
        //                 docker.withRegistry('', DOCKER_USERNAME, DOCKER_PASSWORD) {
        //                     dockerImage.push()
        //                 }
        //             }
        //         }
        //     }
        // }
        def registryCredential = 'docker-credentials-id'
        def dockerImage = "jagadabhibalaji/jenkins:$BUILD_NUMBER"
        
        stage('Deploy Image') {
            steps {
                script {
                    def registryUrl = 'https://index.docker.io/v1/'
                    def docker = Docker.image(registryUrl)
                    def image = docker.image(dockerImage)
                    docker.withRegistry('', registryCredential) {
                        image.push()
                    }
                }
            }
        }
   }
}
