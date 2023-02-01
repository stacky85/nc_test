# nc_test
puppet nginx test
# Usage
For this test I have used the following setup:

- 1 x VM running local on my PC with Arch Linux
- 1 x VM running local on my PC with CentOS 8

Puppet installed on both VMs 

**Puppet nginx module used:** (https://forge.puppet.com/modules/puppet/nginx/)

Having puppet and the module for nginx installed on the VM I've created the following manifests:

`task1.pp`  -> `manifest for task "Create a proxy to redirect requests for https://domain.com to 10.10.10.10 and redirect requests for https://domain.com/resoure2 to 20.20.20.20. "`

`task2.pp` -> `manifest for task "Create a forward proxy to log HTTP requests going from the internal network to the Internet including: request protocol, remote IP and time take to serve the request."`

**How to use/test these manifests:**

On the VM with Arch Linux the manifests are stored in `/etc/puppetlabs/code/manifests`

On the VM with CentOS 8 the manifests are stored in `/etc/puppetlabs/code/environments/production/manifests`

Apply the manifests (copy the manfiests in the path and navigate to manifests path or give full path when doing apply):

`puppet apply task1.pp`  (this will run on the local VM)

Outcome will be a nginx vhost configured as requested in the task

**I have used a self signed SSL certificate**

`puppet apply task2.pp` (this will run on the local VM)

Outcome will be a nginx vhost configured as requested in the task


Sample output from access log for the forward proxy task:

Tested from local network with command:

 `curl -v -x 192.168.56.107:8888 www.google.com`

`192.168.56.1 <- remote ip - [01/Feb/2023:14:20:09 +0200] GET http://www.google.com/ HTTP/1.1 200 http <- request proto 0.262 -> time taken to serve request`
                                                                        


