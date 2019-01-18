# Docker
image_alpine_node_yarn_name := node

.IGNORE: stop

main:
	@echo "[Info] Use others"

prune:
	@echo "[Info] Removing all images and containers"
	@docker system prune -af

build:
	@echo "[Info] Building"
	@docker build -t $(image_alpine_node_yarn_name) --file ./image/alpine-node-yarn.dockerfile image

stop:
	@echo "[Info] Stopping running container"
	@docker rm sudoo-image-temp

sh: stop
	@echo "[Info] Run docker with sh"
	@docker run -it --name sudoo-image-temp $(image_alpine_node_yarn_name) sh

tag:
	@echo "[Info] Tag image"
	@docker tag $(image_alpine_node_yarn_name) sudoo/$(image_alpine_node_yarn_name)

push:
	@echo "[Info] Push image"
	@docker push sudoo/$(image_alpine_node_yarn_name)
