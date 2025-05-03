// pipeline {
//     agent any
//     stages {
//         stage('Clone') {
//             steps {
//                 echo "Cloning repo..."
//                 checkout scm
//             }
//         }
//         stage('Build') {
//             steps {
//                 echo "Building project..."
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo "Running tests..."
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo "Deploying..."
//             }
//         }
//     }
// }


pipeline {
    agent any

    environment {
        FIREBASE_TOKEN = credentials('firebase_token') 
    }

    stages {
        stage('Clone') {
            steps {
                echo "Cloning repo..."
                checkout scm
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    echo "Installing dependencies..."
                    sh 'npm ci'

                    echo "Building frontend..."
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy to Firebase') {
            steps {
                dir('frontend') {
                    echo "Deploying to Firebase..."
                    sh 'npx firebase deploy --token "$FIREBASE_TOKEN"'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image for frontend..."
                dir('frontend') {
                    sh 'docker build -t my-frontend-app:latest .'
                }
            }
        }

        stage('Run with Docker Compose') {
            steps {
                echo "Running with Docker Compose..."
                sh 'docker-compose up -d'
            }
        }
    }
}
