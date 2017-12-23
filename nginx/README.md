#####################################################
###### Important NGINX folders and files ############
#####################################################

# main nginx configuration folders
/etc/nginx/
/etc/nginx/conf.d/
/var/www/html/ 
/var/www/html/{othersite dir}/

/etc/nginx/vhost.d/somesite.conf  -> /var/www/html/somesite/

# ssl directory for ssl certificates
/etc/nginx/ssl/ 



#####################################################
###### NGINX commands ###############################
#####################################################

# test configuration syntax
nginx -t 

# generate self signed certificate - 
https://linuxacademy.com/cp/courses/lesson/course/354/lesson/5/completed/4/module/40

  # generate key 
cd /etc/nginx/ssl && \
sudo openssl genrsa -des3 -out server.key 1024

  # generate .csr with previously created key
openssl req -new -key server.key -out server.csr

  # remove passphraze question from key used in openssl
sudo cp server.key server.key.org && \
sudo openssl rsa -in server.key.org -out server.key

  # generate certificate
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

