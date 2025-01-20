#Validar registro del usuario
aws cognito-idp admin-confirm-sign-up \
  --user-pool-id {USER_POOL_ID} \
  --username {USER_NAME}

#Solicitar token para modificar contraseña del usuario
aws cognito-idp admin-initiate-auth \
  --user-pool-id {USER_POOL_ID} \
  --client-id {CLIENT_ID} \
  --auth-flow ADMIN_NO_SRP_AUTH \
  --auth-parameters "USERNAME={USER_NAME},PASSWORD=********"

#Cambiar contraseña del usuario
aws cognito-idp respond-to-auth-challenge \
  --client-id {CLIENT_ID} \
  --challenge-name NEW_PASSWORD_REQUIRED \
  --challenge-responses "USERNAME={USER_NAME},NEW_PASSWORD=*******"\
  --session {TOKEN}

#Solicitar token para autenticarse con el API Gateway
aws cognito-idp initiate-auth \
  --auth-flow USER_PASSWORD_AUTH \
  --client-id {CLIENT_ID} \
  --auth-parameters "USERNAME={USER_NAME},PASSWORD=*******"

#Enviar petición al API
curl -X POST \
  https://j02okkfvoj.execute-api.us-east-1.amazonaws.com/test/example \
  -H "Authorization: Bearer {TOKEN}"

