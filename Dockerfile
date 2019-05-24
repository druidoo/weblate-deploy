FROM weblate/weblate:3.6.1-1

RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@f7e7ac5dd0ca3c976db1a9176fa338dc3c94f555#egg=weblate-odoo-component-generator

COPY wocg-druidoo /usr/local/bin/

CMD ["runserver"]
