pipeline {
    agent any

    stages {
        stage("Debug") {
            steps {
                sh "env | grep X_"
            }
        }

        stage("Build") {
            when {
                expression {
                    return env.X_REF == null || env.X_REF =~ /ref\/heads\/(master|integration)/
                }
            }

            steps {
                sh '''
                env | sort

                if [ -n "$ghprbSourceBranch" -a -n "$ghprbTargetBranch" -a -n "$ghprbPullId" ]; then
                    echo Will run sonar-scanner with the following parameters:
                    echo -Dsonar.pullrequest.branch=$ghprbSourceBranch -Dsonar.pullrequest.base=$ghprbTargetBranch -Dsonar.pullrequest.key=$ghprbPullId
                elif [ -n "$GIT_BRANCH" ]; then
                    echo Will run sonar-scanner with the following parameters:
                    echo -Dsonar.branch.name=${X_REF#ref/heads/}
                else
                    echo "Unexpected situation, don't know what to do"
                fi
                echo 'DONE'
                '''
            }
        }
    }
}
