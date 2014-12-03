.PHONY: make_data clean_data populate_data

APP_CONTAINERS :=web rabbitmq mysql elasticsearch memcached
DATA_CONTAINERS :=rabbitmq mysql elasticsearch

init_data:
	$(foreach container, $(DATA_CONTAINERS), docker build --rm -t mozilla/olympia_$(container)_data olympia_$(container)_data;)
	$(foreach container, $(DATA_CONTAINERS), docker run --name olympia_$(container)_data mozilla/olympia_$(container)_data;)

clean_data:
        # remove named data containers
	-$(foreach container, $(DATA_CONTAINERS), docker rm --force olympia_$(container)_data;)
        # then remove data images after container dependencies are gone
	-$(foreach container, $(DATA_CONTAINERS), docker rmi mozilla/olympia_$(container)_data;)

rebuild_data: clean_data init_data

init_containers:
	$(foreach container, $(APP_CONTAINERS), docker build --rm -t mozilla/olympia_$(container) olympia_$(container);)
	# do this in order, so that olympia app is guaranteed to have all external services available before provisioning
	fig run mysql /usr/local/bin/provision_mysql.sh; fig stop
	fig run rabbitmq /usr/local/bin/provision_rabbitmq.sh; fig stop
	fig run olympia make full_init; fig stop
