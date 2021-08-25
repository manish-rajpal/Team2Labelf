pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        sh "mvn compile"
      }
    }  
    stage('Robot') {
					steps {
					        catchError {
							    sleep(60)
							    sh 'robot --variable BROWSER:headlesschrome -d Tests/Results Tests'
					        }
							
						}
						post {
							always {
								script {
									step(
										[
											$class                  :   'RobotPublisher',
											outputPath              :   'Tests/Results',
											outputFileName          :   '**/output.xml',
											reportFileName          :   '**/report.html',
											logFileName             :   '**/log.html',
											disableArchiveOutput    :   false,
											passThreshold           :   100,
											unstableThreshold       :   40,
											otherFiles              :   "**/*.png,**/*.jpg",
										]
									)
								}
							}
						}
				 }
    stage('Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
        junit '**/TEST*.xml'
      }
     }
  }
