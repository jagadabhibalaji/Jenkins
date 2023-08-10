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
        stage('Deploy Image') {
            steps {
            script {
                def dockerRegistry = docker.createRegistry()
                docker.withRegistry("${registry}", "${DOCKER_USERNAME}", "${DOCKER_PASSWORD}") {
                    dockerImage.push()
                }
            }
         }
      }

   }
}
