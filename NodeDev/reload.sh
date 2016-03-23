#!/bin/bash

echo "Reloading app, please wait ..."
vagrant ssh -c 'sudo supervisorctl reload'

echo "DONE!"
