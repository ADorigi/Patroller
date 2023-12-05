namespace:
	kubectl apply -f k8s-but-use-make/namespace.yaml
argocd:
	kubectl apply -n argocd -f k8s-but-use-make/argocd.yaml
certificate:
	kubectl apply -n argocd -f k8s-but-use-make/managedcertificate.yaml
externalservice:
	kubectl apply -n argocd -f k8s-but-use-make/externalservice.yaml
backendconfig:
	kubectl apply -n argocd -f k8s-but-use-make/backendconfig.yaml
frontendconfig:
	kubectl apply -n argocd -f k8s-but-use-make/frontendconfig.yaml
ingress:
	kubectl apply -n argocd -f k8s-but-use-make/ingress.yaml

watchcert:
	watch -n 0.5 kubectl describe -n argocd ManagedCertificate 

watchingress:
	watch -n 0.5 kubectl describe -n argocd ingress
