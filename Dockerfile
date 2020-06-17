FROM weblate/weblate:3.8-2

USER 0
#RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@a612a2ab861a91f6b30a2ac56bdf52b42c84cfd2#egg=weblate-odoo-component-generator
RUN pip3 install git+https://github.com/steingabelgaard/weblate-odoo-component-generator#egg=weblate-odoo-component-generator
RUN pip3 install kaptan

COPY wocg-druidoo /usr/local/bin/
USER 1000

COPY entrypoint.sh        /home/weblate/
COPY settings-override.py /home/weblate/

ENTRYPOINT ["/home/weblate/entrypoint.sh"]
