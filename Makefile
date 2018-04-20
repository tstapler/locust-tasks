CONTAINER_NAME=locust-tasks

build:
	docker build -t tstapler/locust-tasks:latest .

push: build
	docker push tstapler/locust-tasks
