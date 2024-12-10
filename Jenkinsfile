pipeline {
  agent any 
   stages {
     stage('Build') {
       steps {
         script {
           echo "Building"
           bat "docker build -t ex9:latest ."
         }
       }
     }
     stage('runnig') {
       steps {
         script {
           echo "runnig"
           bat "docker run -dp 3000:3000 ex9"
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
