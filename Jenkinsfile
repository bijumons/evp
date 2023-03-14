pipeline {
    agent any
    stages {
        stage('Checkout SCM') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[
                        credentialsId: 'bit1',
                        url: 'https://bitbucket.org/atl_admins/evp.git'
                    ]]
                ])
            }
        }
        stage('Migrate Database and Collect Static Files') {
            steps{
                sh """
                    source /home/biju/evp/venv/bin/activate
                    python manage.py makemigrations
                    python manage.py migrate
                    python manage.py collectstatic --noinput
                """
            }
        }
        stage('Setup Gunicorn') {
            steps {
                sh """
                    source /home/biju/evp/venv/bin/activate
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
