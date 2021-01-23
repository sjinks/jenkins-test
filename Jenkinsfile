pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                sh "docker build -t app -f Dockerfile-ci ."
            }
        }

        stage("Test") {
            steps {
                sh "docker run --rm -t app"
            }
        }
    }
}
