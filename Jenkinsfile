pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        registry = "jagadabhibalaji/jenkins"
        registryCredential = 'd2178b8a-9560-487b-a87f-41cd89a90082'
    }
    stages{
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps {
                withCredentials([usernamePassword(credentialsId:'d2178b8a-9560-487b-a87f-41cd89a90082', usernameVariable: 'jagadabhibalaji', passwordVariable: 'Balu@3303')]) {
                    script {
                        docker.withRegistry('', DOCKER_USERNAME, DOCKER_PASSWORD) {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}
