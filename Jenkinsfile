node {
	stage 'Checkout Repo'
	git changelog: false, url: 'https://github.com/renansdias/hello-d'
	
	stage 'Build Docker Image'
	def hash = sh(script: 'git rev-parse HEAD | cut -c1-6 | tr -d \'\n\'', returnStdout: true)
	env.HASH = "${hash}"
	
	sh('docker build -t renansdias/hello-d:${HASH} .')
	
	stage 'Push Docker Image'
	sh('docker push renansdias/hello-d:${HASH}')
	
	stage 'Deploy to Kubernetes'
	sh('sed -i \'s/__VERSION__/\'${HASH}\'/g\' deployment-d.json')
	
	sh('kubectl apply -f deployment-d.json --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config"')

	def serviceName = sh(script: 'kubectl get svc service-d -o name --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config" | tr -d \'\n\r\'', returnStdout: true)
	
	if (serviceName != 'service/service-d') {
		sh('kubectl apply -f service-d.json --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config"')
	}
}