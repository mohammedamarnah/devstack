ENV=. /edx/app/edxapp/edxapp_env && . /edx/app/edxapp/nodeenvs/edxapp/bin/activate && . /edx/app/edxapp/venvs/edxapp/bin/activate &&

SCORMCOMMIT=47fde8ad64a65153ff45a48d07c1f7ec3dd9f0dc

scorm.install:
	docker exec -it edx.devstack.lms sh -c "${ENV} pip install -e git+https://github.com/overhangio/openedx-scorm-xblock@${SCORMCOMMIT}#egg=openedx-scorm-xblock"
	docker exec -it edx.devstack.studio sh -c "${ENV} pip install -e git+https://github.com/overhangio/openedx-scorm-xblock@${SCORMCOMMIT}#egg=openedx-scorm-xblock"

quick-restart:
	make stop
	make dev.up
