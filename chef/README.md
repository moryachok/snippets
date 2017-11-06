#Workstation Commands

_Generating cookbook_

`chef generate cookbook {path to cookbook}` 


_Run Chef dk in a local mode_

`chef-client -z {path to .rb file}`


_Bootstrap a node from the workstation_

`knife bootstrap {node ip} -N {node name} -x {user} --sudo`

_Knife commands:_

* `knife node list` 
* `knife node show ${NODE}`
* `knife node run_list add ${NODE} 'recipe[apache]'`
* `knife cookbook upload {name}` 
* `knife search node 'platform_*:rhel'`
* `knife ssh "role:web" "sudo chef-client" -x {user} -P {pass}`
* `knife role create {name}`
* `knife role edit {name}`
* `knife node run_list set ${NODE} "role[{name}]"
`



#Chef-server commands
_Configure user and organization for chef-server-ctl_

`chef-server-ctl user-create {user} {fname} {lname} {email} '{pass}' --filename misha-rsa.pem`

`chef-server-ctl org-create linuxacademy 'Linux Academy, Inc' --association_user misha --filename linuxacadem-validator.pem`

`chef-server-ctl reconfigure`

# Node Commands

_Check configuration on the node_

`chef-client --why-run`

`ohai` - shows info about a node in JSON:

* `ohai` 
* `ohai ipaddress`
* `ohai | grep cpu`


# Chef filesystem

Chef-client configuration file: \
`vi /etc/chef/client.rb`


