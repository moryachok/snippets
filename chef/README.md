_Generating cookbook_

`chef generate cookbook {path to cookbook}`


_Run Chef dk in a local mode_

`chef-client -z {path to .rb file}`


_Configure user and organization for chef-server-ctl_

`chef-server-ctl user-create {user} {fname} {lname} {email} '{pass}' --filename misha-rsa.pem
`

`chef-server-ctl org-create linuxacademy 'Linux Academy, Inc' --association_user misha --filename linuxacadem-validator.pem`


_bootstrap a node from the workstation_

`knife bootstrap {node ip} -N {node name} --ssh-user {user} --sudo`