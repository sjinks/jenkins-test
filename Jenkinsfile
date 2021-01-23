pipeline {
    agent any

    tools {
        dockerTool 'Docker'
    }

    stages {
        stage("Prepare") {
            steps {
                sh "env | sort"
            }
        }

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
