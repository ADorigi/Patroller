tfplan:
	@terraform fmt -v -recursive
	TF_VAR_kubeconfig="~/.kube/config" terraform plan

tfapply:
	TF_VAR_kubeconfig="~/.kube/config" terraform apply --auto-approve	