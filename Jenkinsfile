node{
    
    echo 'Hello world'
    
    stage('Clone code') {
        echo 'Clone code'
        try{
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/trinhnguyenvnm/Test01.git']]])
            currentBuild.result = 'SUCCESS'
        }catch(any){
		    currentBuild.result = 'FAILURE'
		    throw any
        }
    }

    stage('install npm') {
        echo 'install npm'
        try{
            nodejs(configId: 'c3cfcfec-3d5f-4eca-8a47-dec39f3f3570', nodeJSInstallationName: 'NodeJS v9-latest') {
                sh 'npm install'
                sh 'npm install @angular/cli'
                currentBuild.result = 'SUCCESS'
            }

        }catch(any){
            currentBuild.result = 'FAILURE'
        }
    }

    stage('Unit Test') {
        echo 'run UT'

        try{
            nodejs(configId: 'c3cfcfec-3d5f-4eca-8a47-dec39f3f3570', nodeJSInstallationName: 'NodeJS v9-latest') {
                sh 'npm test'
                currentBuild.result = 'SUCCESS'
            }

        }catch(any){
            currentBuild.result = 'FAILURE'
        }
    }

    stage('Deploy') {
        echo 'deploy'

        try{
            nodejs(configId: 'c3cfcfec-3d5f-4eca-8a47-dec39f3f3570', nodeJSInstallationName: 'NodeJS v9-latest') {
                sh 'npm run-script build'
                // TODO: deploy to server
                currentBuild.result = 'SUCCESS'
            }
        } catch(any) {
            currentBuild.result = 'FAILURE'
        }
    }
}
