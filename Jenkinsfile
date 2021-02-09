pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                properties([
                    pipelineTriggers([
                        GenericTrigger(
                            causeString: 'GitHub',
                            genericHeaderVariables: [[key: 'x-github-event', regexpFilter: '']],
                            genericVariables: [
                                [defaultValue: '', key: 'X_ACTION', regexpFilter: '', value: '$.action'],
                                [defaultValue: '', key: 'X_TARGET_BRANCH', regexpFilter: '', value: '$.pull_request.base.ref'],
                                [defaultValue: '', key: 'X_SOURCE_BRANCH', regexpFilter: '', value: '$.pull_request.head.ref'],
                                [defaultValue: '', key: 'X_PR_NUMBER', regexpFilter: '', value: '$.pull_request.number'],
                                [defaultValue: '', key: 'X_REF', regexpFilter: '', value: '$.ref'],
                                [defaultValue: '', key: 'X_COMMENT_BODY', regexpFilter: '', value: '$.comment.body']
                            ],
                            printContributedVariables: true,
                            printPostContent: false,
                            regexpFilterExpression: '',
                            regexpFilterText: '',
                            token: 'topsecret',
                            tokenCredentialId: ''
                        )
                    ]),
                    githubPush(),
                    [
                        $class: 'org.jenkinsci.plugins.ghprb.GhprbTrigger',
                        useGitHubHooks: true
                    ]
                ])

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
                echo 'DONE'
                '''
            }
        }
    }
}
