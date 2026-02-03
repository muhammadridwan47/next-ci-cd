install Jenkins plugin:

 - Docker Pipeline
 - Blue Ocean
 - Pipeline: Stage Step

Webhooks plugin for Jenkins Multibranch Scan Webhook Trigger: 
https://plugins.jenkins.io/multibranch-scan-webhook-trigger/

https://stackoverflow.com/questions/75876315/jenkins-generic-webhook-trigger-plugin-and-multibranch-scan-webhook-trigger-i

https://www.youtube.com/watch?v=Uu8_cb0WRAw


Build project in jenkins:
Home jenkins:
    -> New Item
    -> Multibranch Pipeline
    -> configuration
         -> branch source: git -> url: urrepo.git
         -> Scan Multibranch Pipeline Triggers -> inter val : 1day -> Scan by webhook (Trigger token): mytoken ->  (https://992749af909f.ngrok-free.app/multibranch-webhook-trigger/invoke?token=mytoken) 

