state.help:
	@echo ""
	@echo "make state.COMMAND"
	@echo "======================================"
	@echo ""
	@echo "Commands:"
	@echo "migrate:              Run django migrations i.e. python manage.py migrate"
	@echo "langs_push:           Run django langs_push command i.e. python manage.py langs_push"
	@echo "langs_pull:           Run django langs_pull command i.e. python manage.py langs_pull"
	@echo "install_pip:          Install python dependencies in 'requirements.txt' file"
	@echo "install_npm:          Install npm dependencies in 'package.json' file"
	@echo "copy_cache:           Copy node_modules, installed at build time, to the current app"
	@echo "dev:                  Run npm run dev command"
	@echo "watch:                Run gulp watch"
	@echo "install_all:          Runs install_pip, install_npm, dev, migrate"
	@echo "watch_js:             Run watcher to watch JavaScript changes"
	@echo "watch_css:            Run watcher to watch and compile scss changes"
	@echo "shell:                Open bash shell inside docker container"
	@echo "provision:            Run provision script, prepare the env"
	@echo "restart:              Restart the container"
	@echo "manage <Command>:     Run any manage.py command"
	@echo "fix-npm:              Fix .npm folder ownership issue"
	@echo "help:                 Print help and exit"
	@echo ""

state.migrate:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api python manage.py migrate --settings=edraakprograms.dev

state.langs_push:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api python manage.py langs_push --settings=edraakprograms.dev

state.langs_pull:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api python manage.py langs_pull --settings=edraakprograms.dev

state.install_pip:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api pip install -r requirements.txt

state.install_npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api npm install

state.copy_cache:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api cp -Rnv /cache/node_modules /cache/.compiled /app

state.dev:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api npm run dev

state.watch:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api npm run dev:watch

state.install_all: | state.install_pip state.install_npm state.dev state.migrate

state.watch_js:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api npm run dev:watch

state.watch_css:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api npm run watch-scss

state.fix-npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec state-manager-api bash -c 'chown -R root ~/.npm'

