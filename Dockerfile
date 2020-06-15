FROM weblate/weblate:3.8-2

USER 0
RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@a612a2ab861a91f6b30a2ac56bdf52b42c84cfd2#egg=weblate-odoo-component-generator
COPY wocg-druidoo /usr/local/bin/
USER 1000

CMD ["runserver"]
