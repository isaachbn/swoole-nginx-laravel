FROM owasp/modsecurity:3.0.3-nginx

RUN git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /usr/local/owasp-modsecurity-crs \
   && cd /usr/local/owasp-modsecurity-crs
COPY ./crs-setup.conf /etc/nginx/modsec/crs-setup.conf
COPY ./unicode.mapping /etc/nginx/modsec/unicode.mapping
COPY ./modsecurity.conf /etc/nginx/modsec/modsecurity.conf
COPY ./main.conf /etc/nginx/modsec/main.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./wait-for-it.sh /local/bin/wait-for-it.sh
COPY ./start.sh /local/bin/start.sh
RUN chmod +x /local/bin/wait-for-it.sh; chmod +x /local/bin/start.sh;

ENTRYPOINT ["/local/bin/start.sh"]

EXPOSE 80 443
