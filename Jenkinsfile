pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                script {
                    if (env.X_REF != null && !(env.X_REF =~ /ref\/heads\/(master|integration)/)) {
                        currentBuild.result = 'NOT_BUILT'
                        publishChecks conclusion: 'SKIPPED', detailsURL: env.BUILD_URL, name: 'CI', text: 'Cont Int', title: 'The CI'
                        return
                    }

                    if (env.X_REF != null) {
                        publishChecks conclusion: 'NONE', detailsURL: env.BUILD_URL, name: 'CI', status: 'IN_PROGRESS', text: 'Cont Int', title: 'The CI'
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
            post {
                always {
                    echo currentBuild.result
                        // if (env.X_REF != null) {
                        //     publishChecks conclusion: 'FAILURE', detailsURL: env.BUILD_URL, name: 'CI', text: 'Cont Int', title: 'The CI'
                        // }

                }
            }
        }
    }
}
