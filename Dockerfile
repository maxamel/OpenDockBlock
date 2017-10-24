FROM webdizz/centos-java8-sshd
RUN groupadd miners
RUN for ((i=1; i<21; i++)) do adduser miner$i -G miners -m -d /home/pubminer$i/; echo miner$i:miner$i | chpasswd; mkdir /home/pubminer$i/prvminer$i; chown miner$i:miners /home/pubminer$i; chown miner$i:miners /home/pubminer$i/prvminer$i; chmod 740 /home/pubminer$i; chmod 700 /home/pubminer$i/prvminer$i; openssl genpkey -algorithm RSA -out /home/pubminer$i/prvminer$i/private_key.pem -pkeyopt rsa_keygen_bits:2048; openssl rsa -pubout -in /home/pubminer$i/prvminer$i/private_key.pem -out /home/pubminer$i/public_key.pem; done
