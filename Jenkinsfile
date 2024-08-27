pipeline {
    agent { label "Tomcat"}
    
    stages {
        
        stage("code"){
            steps{
                git url: "https://github.com/shelke1234/simple-reactjs-app.git", branch: "master"
                
            }
        }
        stage("build and test"){
            steps{
                sh "docker build -t react-front-end ."
            }
        }
        stage("scan image"){
            steps{
                echo 'image scanning ho gayi'
            }
        }
        stage("push"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker tag react-front-end:latest dhananjayshelke/react-front-end:latest"
                sh "docker push dhananjayshelke/react-front-end:latest"
                
                }
            }
        }
        stage("deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
                echo 'deployment ho gayi'
            }
        }
    }
}
