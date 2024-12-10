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
