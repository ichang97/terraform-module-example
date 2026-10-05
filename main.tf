module "dev_nginx" {
	source = "./modules/nginx"
	container_name = "chang-dev"
	host_port = 8081
}

module "prod_nginx" {
	source = "./modules/nginx"
	container_name = "chang-prod"
	host_port = 8082
}

output "dev_url" {
	value = module.dev_nginx.app_url
}

output "prod_url" {
	value = module.prod_nginx.app_url
}
