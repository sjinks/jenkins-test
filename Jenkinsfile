pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                sh '''
                env | sort
                if [ -n "$ghprbSourceBranch" -a -n "$ghprbTargetBranch" -a -n "$ghprbPullId" ]; then
                    echo Will run sonar-scanner with the following parameters:
                    echo -Dsonar.pullrequest.branch=$ghprbSourceBranch -Dsonar.pullrequest.base=$ghprbTargetBranch -Dsonar.pullrequest.key=$ghprbPullId
                elif [ -n "$GIT_BRANCH" ]; then
                    echo Will run sonar-scanner with the following parameters:
                    echo -Dsonar.branch.name=${GIT_BRANCH#origin/}
                else
                    echo "Unexpected situation, don't know what to do"
                fi
                '''
            }
        }
    }
}
