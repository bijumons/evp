pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/bijumons/evp.git']]
                ])
            }
        }
        stage('Env Setup') {
            steps {
                withEnv(['GIT_ASKPASS': 'git app pwd']) {
                    sh """
                        git fetch --tags --force --progress -- https://github.com/bijumons/evp.git +refs/heads/*:refs/remotes/origin/*
                        git checkout -f origin/master
                        chmod +x envsetup.sh
                        ./envsetup.sh
                    """
                }
            }
        }
        stage('Setup Gunicorn') {
            steps {
                withEnv(['PATH+VENVS': 'venv/bin']) {
                    sh """
                        chmod +x gunicorn.sh
                        ./gunicorn.sh
                    """
                }
            }
        }
        stage('Setup Nginx') {
            steps {
                sh """
                    chmod +x nginx.sh
                    ./nginx.sh
                """
            }
        }
    }
}
