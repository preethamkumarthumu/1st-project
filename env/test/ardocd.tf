############################################
# Argo CD
############################################
 
module "argocd" {
  source = "../../modules/devops/argocd"
 
  # Project
  project_name = var.project_name
  environment  = var.environment
  common_tags  = var.common_tags
 
  # Kubernetes
  namespace = "argocd"
 
  # Helm
  helm_repository = var.argocd_helm_repository
  chart_name  	= var.argocd_chart_name
  chart_version   = var.argocd_chart_version
 
  # GitOps
  git_repository_url  = var.argocd_git_repository_url
  git_target_revision = var.argocd_git_target_revision
  git_path        	= var.argocd_git_path
 
  # Application
  application_name  	= "speshway-crm"
  destination_namespace = "auth"
 
  depends_on = [
    module.eks
  ]
} 
