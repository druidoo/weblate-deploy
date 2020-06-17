#!/bin/bash
set -e

echo "Setting up symlink for settings-override.py.."
ln -sf /home/weblate/settings-override.py /app/data/settings-override.py

# Start weblate
/app/bin/start runserver
