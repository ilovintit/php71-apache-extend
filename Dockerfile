FROM ilovintit/php71-apache-with-node
MAINTAINER ilovinti <ilovintit@gmail.com>
RUN mkdir /var/instantclient
COPY ./instantclient-basic-linux.x64-12.2.0.1.0.zip /
RUN unzip /instantclient-basic-linux.x64-12.2.0.1.0.zip -d /var/instantclient
RUN ln -s /var/instantclient/libclntsh.so.12.1 /var/instantclient/libclntsh.so
RUN ln -s /var/instantclient/libocci.so.12.1 /var/instantclient/libocci.so
RUN export LD_LIBRARY_PATH=/var/instantclient
RUN pecl install oci8 && docker-php-ext-enable oci8
