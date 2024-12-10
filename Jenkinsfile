pipeline {
  agent any 
   stages {
     stage('Build') {
       steps {
         script {
           echo "Building"
           bat "docker build -t ex1:latest ."
         }
       }
     }
     stage('runnig') {
       steps {
         script {
           echo "runnig"
           bat "docker run -dp 127.0.0.1:3000:3000 ex1"
         }
       }
     }
     stage('test') {
       steps {
         script {
           echo "testing"
         }
       }
     }
        stage('deploying') {
       steps {
         script {
           echo "deploying"
         }
       }
     }
   }
}
