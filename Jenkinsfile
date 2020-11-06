pipeline {
    agent any

	tools {
		maven 'maven3.6'
	}
//
//	environment {
//		M2_INSTALL = "/home/mani/packages/apache-maven-3.6.3/bin/mvn"
//	}

    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
	
		stage('Build') {
			steps {
				sh 'mvn install -Dmaven.test.skip=true'
			}
		}
		
		stage('Unit Tests') {
			steps {
				sh 'mvn compiler:testCompile'
				sh 'mvn surefire:test'
			}
		}

	
		stage('Deployment') {
			steps {
				sh 'sshpass -p "mani" scp target/gamutgurus.war mani@172.17.0.3:/home/mani/packages/apache-tomcat-8.5.58/webapps'
				sh 'sshpass -p "mani" ssh mani@172.17.0.3 "JAVA_HOME=/home/mani/packages/jdk1.8.0_261" "/home/mani/packages/apache-tomcat-8.5.58/bin/startup.sh"'
	    	}
		}
    }
}
