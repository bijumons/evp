pipeline {
    agent any
    stages {
        stage('Env Setup') {
            steps {
             sh """
                 chmod +x envsetup.sh
                 ./envsetup.sh
             """
            }
        }
        stage('Setup Gunicorn') {
            steps {
                sh """
                    source venv/bin/activate
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
