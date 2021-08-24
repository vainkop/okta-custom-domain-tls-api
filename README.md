# Okta Custom domain TLS certificate upload over API
  
1) Use docker-compose.yml to get let's encrypt certificate & private key into `/etc/letsencrypt/live/$DOMAIN` folder  

2) Use cron to upload it to Okta over API with `run.sh` +`template`+`envsubst (gettext)`  

The following variables are required:

template:
```  
API_TOKEN
DOMAIN_ID
YOUR_OKTA_DOMAIN
```  

run.sh:
```
YOUR_OKTA_DOMAIN
```

docker-compose.yml:
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION
YOUR_OKTA_DOMAIN
```  
  
[Okta API doc](https://developer.okta.com/docs/reference/api/domains/#request-3)
  
  
[If you have any questions/suggestions you can contact me directly in Telegram Here](https://t.me/vainkop)