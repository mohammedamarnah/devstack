FROM eu.gcr.io/openedx-231314/edraak/edxapp:hawthorn.edraak.v3
USER root

COPY ./base.txt ./base.txt

RUN . /edx/app/edxapp/edxapp_env && . /edx/app/edxapp/nodeenvs/edxapp/bin/activate && . /edx/app/edxapp/venvs/edxapp/bin/activate && pip install -r base.txt
