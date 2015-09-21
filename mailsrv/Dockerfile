FROM tvial/docker-mailserver:v2

RUN apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:duplicity-team/ppa && \
 	apt-get update && \
	apt-get install -y netcat makepasswd rcs perl-doc libio-tee-perl \
										git libmail-imapclient-perl libdigest-md5-file-perl \
										libterm-readkey-perl libfile-copy-recursive-perl \
										build-essential make automake libunicode-string-perl \
										duplicity afpfs-ng-utils lftp par2

RUN git clone git://github.com/imapsync/imapsync.git --depth 1

RUN cd imapsync/ && \
	cpan -i Authen::NTLM Data::Uniqid IO::Socket::INET6 JSON::WebToken \
					Readonly Test::MockObject Test::Pod

RUN cd imapsync/ && \
	make install

ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
