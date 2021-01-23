pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                sh "docker build -t app ."
            }
        }

        stage("Test") {
            steps {
                sh "docker run --rm -t app"
            }
        }
    }
}
