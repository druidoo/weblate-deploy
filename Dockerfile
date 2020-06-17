FROM weblate/weblate:3.8-2

USER 0
RUN pip3 install git+https://github.com/druidoo-dev/weblate-odoo-component-generator@druidoo#egg=weblate-odoo-component-generator
RUN pip3 install kaptan
COPY wocg-druidoo /usr/local/bin/
USER 1000

COPY entrypoint.sh        /home/weblate/
COPY settings-override.py /home/weblate/

ENTRYPOINT ["/home/weblate/entrypoint.sh"]
