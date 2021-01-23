pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                sh '''
                if [ -n "$CHANGE_BRANCH" -a -n "$CHANGE_TARGET" -a -n "$CHANGE_ID" ]; then
                    echo Will run sonar-scanner with the following parameters:
                    echo -Dsonar.pullrequest.branch=$CHANGE_BRNACH -Dsonar.pullrequest.base=$CHANGE_TARGET -Dsonar.pullrequest.key=$CHANGE_ID
                elif [ -n "$GIT_BRANCH" ]; then
                    echo Will run sonar-scanner with the following parameters:
                    echo -Dsonar.branch.name=$GIT_BRANCH
                else
                    echo "Unexpected situation, don't  know what to do"
                    env | sort
                fi
                '''
            }
        }
    }
}
