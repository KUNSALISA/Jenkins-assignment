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
    agent {
        docker {
            image 'node:18'  // ใช้ Node.js 18 ที่มี npm ติดตั้งแล้ว
        }
    }
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
        stage('Install Firebase CLI') {
            steps {
                echo "Installing Firebase CLI globally..."
                sh 'npm install -g firebase-tools'
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
                dir('frontend') {
                    // เพิ่ม test ได้ภายหลัง
                    sh 'echo "No tests configured yet."'
                }
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
