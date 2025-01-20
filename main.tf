module "lbda_apigw_waf" {
  source = "github.com/con3rasjf/tf-aws-lambda-apigw-waf?ref=release_module"

  providers = {
    aws = aws.virginia
  }
  function_name = "lambda_zulu"
  description   = "Lambda de prueba"
  memory_size   = 128
  runtime       = "python3.9"
  function_env = {
    "zulu" : "Transacción exitosa"
  }
  api_name        = "api_zulu"
  api_description = "API de Zulu"
  rate_limit      = 10
}
