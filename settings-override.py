import subprocess
import os
from weblate.celery import app


ADMINS = ()


@app.task
def wocg_druidoo():
    print('Calling wocg-druidoo..')
    subprocess.check_call("wocg-druidoo")


@app.on_after_finalize.connect
def setup_periodic_tasks(sender, **kwargs):
    sender.add_periodic_task(
        int(os.environ.get('SYNC_COMPONENTS_INTERVAL', 3600)),
        wocg_druidoo.s(),
        name='wocg-druidoo',
    )
