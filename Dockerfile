FROM ilovintit/php71-apache-with-node
MAINTAINER ilovinti <ilovintit@gmail.com>
COPY . /tmp
RUN unzip /tmp/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /usr/local \
	&& unzip /tmp/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip -d /usr/local \ 
	&& unzip /tmp/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /usr/local \
	&& mv /usr/local/instantclient_11_2 /usr/local/instantclient
RUN ln -s /usr/local/instantclient/libclntsh.so.11.1 /usr/local/instantclient/libclntsh.so
RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus
RUN ln -s /usr/local/instantclient/liblibocci.so.12.1 /usr/local/instantclient/libocci.so
RUN apt-get install libaio-dev -y
RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8
RUN docker-php-ext-enable oci8
