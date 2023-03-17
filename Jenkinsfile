pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/master']],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [],
                          submoduleCfg: [],
                          userRemoteConfigs: [[url: 'https://github.com/bijumons/evp.git']]])
            }
        }
        stage('Env Setup') {
            steps {
             sh """
                 git pull
                 chmod +x envsetup.sh
                 ./envsetup.sh
             """
            }
        }
        stage('Setup Gunicorn') {
            steps {
                sh """
                    . venv/bin/activate
                    chmod +x gunicorn.sh
                    ./gunicorn.sh
                """
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
