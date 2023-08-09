pipeline {
     agent any
     stages {
         stage('Hello Stage') {
               steps {
                    echo 'hello world part7'
               }
          }
          stage() {
               when { changeset "nginx/*"}
               steps {
                    sh "make build-nginx"
                    sh "make start-nginx"
               }
          }
     }
}
