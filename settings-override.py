import subprocess

from weblate.celery import app


ADMINS = ()


@app.task
def wocg_druidoo():
    print('Calling wocg-druidoo..')
    subprocess.check_call("wocg-druidoo")


@app.on_after_finalize.connect
def setup_periodic_tasks(sender, **kwargs):
    print('Setting up periodic task for druidoo')
    sender.add_periodic_task(
        3600,
        wocg_druidoo.s(),
        name='wocg-druidoo',
    )
