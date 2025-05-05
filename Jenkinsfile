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
        FIREBASE_TOKEN = credentials('firebase-token')
    }
    triggers {
        githubPush()  
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
                echo "Installing dependencies & building frontend..."
                dir('frontend') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('Test Frontend') {
            steps {
                echo "Running frontend tests..."
            }
        }
        stage('Deploy to Firebase') {
            steps {
                echo "Deploying to Firebase Hosting..."
                dir('frontend') {
                    sh 'firebase deploy --only hosting --token "$FIREBASE_TOKEN"'
                }
            }
        }
    }
}