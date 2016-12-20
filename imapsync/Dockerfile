FROM debian:jessie-slim

RUN apt-get update && \
	apt-get install -y netcat makepasswd rcs perl-doc libio-tee-perl git libmail-imapclient-perl libdigest-md5-file-perl libterm-readkey-perl libfile-copy-recursive-perl build-essential make automake libunicode-string-perl

RUN git clone git://github.com/imapsync/imapsync.git --depth 1

RUN cd imapsync/ && \
	cpan -i Authen::NTLM Data::Uniqid IO::Socket::INET6 JSON::WebToken Readonly Test::MockObject Test::Pod

RUN cd imapsync/ && \
	make install

ADD sync.sh /sync.sh

RUN chmod +x /sync.sh

ENTRYPOINT ["/sync.sh"]
