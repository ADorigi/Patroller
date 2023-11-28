resource "helm_release" "argocd" {
  name             = "argocd-helm-release"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "5.51.4"

  values = [file("values/argocd.yaml")]
}