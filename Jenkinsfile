node {
    stage('Get Source'){
        git 'https://github.com/Minal-Mahor/kubernetes-jenkins.git'
    }
   
    stage('Docker-push'){
        docker.withRegistry('https://registry.hub.docker.com','dockerHub'){
            def customImage = docker.build('minalmahor/k8scluster')
            customImage.push()
        }
    }
    stage('Authenticate'){
        
            bat ''' ibmcloud login --apikey dc921883bdce42938562ec40bab840ba  -r  us-south -g Default
            ibmcloud plugin install -f container-service
            ibmcloud plugin install -f container-registry
            ibmcloud plugin install -f observe-service
            ibmcloud plugin list
            ibmcloud ks cluster config --cluster c0rj4r1d0huad5id0ut0
                    
             '''
        
    }
    
    stage('Kubernetes pod'){
        bat "ibmcloud ks cluster config --cluster c0rj4r1d0huad5id0ut0"
        bat "kubectl config current-context"
        bat 'kubectl apply -f service.yaml'
        bat 'kubectl apply -f deployment.yaml'
        bat 'kubectl get pods'
    }
}
