node{
    
    echo 'Hello world'
    
    stage('Clone code') {
        echo 'Clone code'
        try{
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/trinhnguyenvnm/Test01.git']]])
        }catch(any){
		    currentBuild.result = 'FAILURE'
		    throw any
        }
        if(currentBuild.result = 'SUCCESS'){
            echo 'T:Success clone code'
        }
    }

    stage('install npm') {
        echo 'install npm'
        try{
            sh 'npm install'
        }catch(any){
            currentBuild.result = 'FAILURE'
        }
    }

    stage('Unit Test') {
        echo 'run UT'
    }

    stage('Deploy') {
        echo 'deploy'
    }
}
