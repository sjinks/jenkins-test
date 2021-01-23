pipeline {
    agent any

    stages {
        stage("Build") {
            sh "docker build -t app ."
        }

        stage("Test") {
            sh "docker run --rm -t app"
        }
    }
}
