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
                withEnv(['overrides' : ['GIT_ASKPASS=git app pwd']]) {
                    sh """
                        git pull origin master
                        chmod +x envsetup.sh
                        ./envsetup.sh
                    """
                }
            }
        }
        stage('Setup Gunicorn') {
            steps {
                withEnv(['overrides' : ['PATH+VENVS=venv/bin']]) {
                    sh """
                        . venv/bin/activate
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
