pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t intra/centos7_py3_base'
            }
        }
    }
}