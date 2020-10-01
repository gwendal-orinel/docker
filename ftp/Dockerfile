FROM arm32v7/debian
RUN apt-get update -y && apt-get install -y vsftpd vim
COPY vsftpd.conf /etc/vsftpd.conf
RUN chown nobody:nogroup /data
RUN chown -R ftp:ftp /data/upload
CMD bash -c 'service vsftpd start && tail -f /var/log/vsftpd.log'