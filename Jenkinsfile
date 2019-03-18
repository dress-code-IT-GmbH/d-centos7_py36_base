pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t intra/centos7_py36_base .'
            }
        }
       stage('Push ') {
            when {
                expression { params.pushimage?.trim() != '' }
            }
            steps {
                sh '''
                    if [[ "$DOCKER_REGISTRY_USER" ]]; then
                        echo "Docker registry user: $DOCKER_REGISTRY_USER"   # defined in Jenkins env
                        docker tag intra/centos7_py36_base $DOCKER_REGISTRY_USER/centos7_py36_base
                        docker push $DOCKER_REGISTRY_USER/centos7_py36_base
                    else
                        echo 'DOCKER_REGISTRY_USER not defined - cannot push image'
                    fi
                '''
            }
        }
    }
}
