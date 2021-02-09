pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                script {
                    if (env.X_REF != null && !(env.X_REF =~ /ref\/heads\/(master|integration)/)) {
                        currentBuild.result = 'NOT_BUILT'
                        return
                    }
                }

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
