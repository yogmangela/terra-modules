# AWS Tips a Must read for cloud Enthusiasts:

I was preparing for ```AWS DevOps Professional exam`` came across some useful hacks must read if you are cloud enthusiast. I have shared actual link at the end too.

#### 1. Best adviced not to store application state on your servevrs. 
So for example if you provision infrastructure using Terraform as IaaC. Terraform generates ``terraform.tfstate`` file which stores some key configurtion informations:
- - key_name, ami, arn, AZ etc. Thiss are critical configuration of your infrastructure. **You never ever edit this setting** hence best advice not to store localy.

#### 2.  Storing extra details in your logs:
By default you get timestamp and processid, would be benificial to store information such as ins-id, AZ, env, region etc for better and quick debugging.

#### 3.  Use SDK for your language instead if you ever need to interact with AWS.

#### 4. Make sure to have other tools in your armory to view your application logs. 
such as syslog, ELK stack, Nagios etc.

#### 5. Disable SSH access to all servers.
It very tempting to SSH and fix problem on a server but think about security & Automation. Automation every thing shoudl be automated. They say ``If you have to SSH into your server, then you have failed your automation pipeline.`` May be good idea to disable it at the Firewall level.
#### 6. Ephemeral - Don't bring dead server alive.
So you don't care about server dying. You cacn use Auto-Scaling to create replica. Speaking of replicas, try kubernetes, its greate way to deploy your application. You can create deployment to set number of nodes, container and replicas. one dies it will create another one as it manages replica-state. So if you have specified you need 3 replicas it will always keep running 3 replicas of your application. in nutshell you only care about the servic as a whole.

#### 7. Don't give servers static/elastic IP:
all all your app behind Load Balancer and balance between Availability Zones. Every instance get's it unique pvt and pub IP.

#### 8. Must Automation everything as much as possible:
From recovery, deployment, failover, patching, Packaging use Configuration Managemnt tools such as Ansible, Chef or Puppet. ``Ansible`` is way for me.

#### 9. Everyone gets an IAM account so never login using master. I don't see any reason why should one use master account. (prove in wrong).

#### 10. Set alerts to become notifications:

#### 11. Set up detailed billing alerts:
- $1/mo, $10/mo, $50/mo, $100/mo, $250/mo, $500/mo, and $1,000/mo. It helps know you where you are each week in terms of billings.

 #### 12. Use EC2 roles, best advicecd not to provide IAM ccount to an application:

 #### 13. Assign permissions to groups, not to users:

#### 14. Automat your security auditing:
create security auditor role: 
- [security-auditer-role.json](https://s3.amazonaws.com/reinvent2013-sec402/secaudit.json)
- [use this to configure](https://s3.amazonaws.com/reinvent2013-sec402/SecConfig.py)

#### 15. Use CloudTrail to keep an audit log.

#### 16. Use ``-`` hyphen instead of "." when naming S3 bucket for SSL.

#### 17. Avoid filesystem mounts use SDK.

#### 18. It make sense not using Cloudfront in front os S3 bucket.

#### 19. Use random strings at the start of your keys.

#### 20. Use sensible tags on EC2 instances:

#### 21. protect non-Auto-Scaling instances:
I had situaltion where OPS deleted one of instace hence I had to rebuild the instance.

#### 22. Use VPC:
Not default VPC, Strongly advice to create your VPC for your project. create terraform re-usable module which you can providion and deprovision at will.

#### 23. reserved instance to save cost.
If you know you will be needing 30 X Instances for more than a year then better reserve it will save you money. turst me it will be very cheap comparing on-demand instacnes.

#### 24. Security Groups:
Never add 0.0.0.0/0 open to all. add only ports you need to use.

#### 25. Elastic Ip cost so delete them.
I learnt my lesson when all of a sudden I started getting alerts and contacted AWS they said it Elastic IP costing your money. By default it doesn't delete E-IP. so make-sue you have deleted then.

#### 26. Terminate SSL on the load balancer.

#### 27. Pre-heat you owav so samething with ELB's. Elastic load Balancer.

So it you know your application will need extra helps during certian hours or day. Then pre-heat your ELB using injecting load to your ELB.

#### 28. Elasticache: Use the configuration endpoints, instead od individual node endpoints.

#### 29. RDS: Setup an event subscription for failover.

#### 30. Cloudwatch:
- use the free metrics.
- use custom metrics
- use the CLCI tools if you know how to use.
- use detailed monitoring: 10 minutes is better then 20minutes. and 1minutes is better than 5minutes.

#### 31. Auto-Scaling:
- Scale down on insufficient data as well as Alarm.
- Use ELB health check instead of EC2 health checks.
- Only use the AZ your ELB is configures for
- Don't use multiple scaling triggers on the same group.

#### 32. IAM:
- Always use Roles rather than user for application.
- Users can have multiple API keys.
- IAM users can have multi-factor authentication.
#### 33. Route53: Make sure to use Alias records.

#### 34. Elastic mapreduce:
I had this issue with Elastic Mapreduce (EMR) when pointing to S3 bucket. was getting ``NullPointerException`` error. after 15-20min Googling found out that. It needs exact path. specify a directory in bucket.

#### 35. Miscellaneous Tips:
- Horizontal scaling is better than vertical i think. Kubernetes only supports Horozontal scaling.

- Make sure to redundant across AZ
- Be aware of AWS service limits before you provision anything.
- Decide on a naming convention and stick to it. 
- introduce key-management strategy from beginning.
- Make sure AWS is the cloud service: I my self prefere AWS. That doesn't mean it's the best in market for your project. Give your self sometime to explore other cloud provider’s likes of: GCP, AZURE, Oracle-cloud, Alibaba and Openstacketc 



Ref: 
- https://aws.amazon.com/cloudtrail/getting-started/ 
- http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html 
- http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-cost 
- https://wblinks.com/notes/aws-tips-i-wish-id-known-before-i-started/



