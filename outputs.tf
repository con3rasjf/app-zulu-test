output "api_gateway_url" {
  description = "Invoke URL for the API Gateway"
  value       = module.lbda_apigw_waf.api_gateway_url
}

output "waf_web_acl_id" {
  description = "ID of the WAF Web ACL"
  value       = module.lbda_apigw_waf.waf_web_acl_id
}
