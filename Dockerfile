FROM ilovintit/php71-apache-with-node
MAINTAINER ilovinti <ilovintit@gmail.com>
COPY ./instantclient-basic-linux.x64-12.2.0.1.0.zip /
RUN mkdir -p /usr/lib/oracle/client64
RUN unzip /instantclient-basic-linux.x64-12.2.0.1.0.zip -d / && mv /instantclient_12_2 /usr/lib/oracle/client64/lib
RUN ln -s /usr/lib/oracle/client64/lib/libclntsh.so.12.1 /usr/lib/oracle/client64/lib/libclntsh.so
RUN ln -s /usr/lib/oracle/client64/liblibocci.so.12.1 /usr/lib/oracle/client64/lib/libocci.so
RUN echo 'instantclient,/usr/lib/oracle/client64' | pecl install oci8
RUN docker-php-ext-enable oci8
