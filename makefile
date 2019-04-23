# Docker
image_alpine_node_yarn_name := node
node_build_name := node-build

.IGNORE: stop

main:
	@echo "[Info] Use others"

prune:
	@echo "[Info] Removing all images and containers"
	@docker system prune -af

build:
	@echo "[Info] Building"
	@docker build -t $(image_alpine_node_yarn_name) --file ./image/alpine-node-yarn.dockerfile image

build-node-build:
	@echo "[Info] Building"
	@docker build -t $(node_build_name) --file ./image/node-build.dockerfile image

stop:
	@echo "[Info] Stopping running container"
	@docker rm sudoo-image-temp

sh: stop
	@echo "[Info] Run docker with sh"
	@docker run -it --name sudoo-image-temp $(image_alpine_node_yarn_name) sh

sh-node-build: stop
	@echo "[Info] Run docker with sh"
	@docker run -it --name sudoo-image-temp $(node_build_name) sh

tag:
	@echo "[Info] Tag image"
	@docker tag $(image_alpine_node_yarn_name) sudoo/$(image_alpine_node_yarn_name)

tag-node-build:
	@echo "[Info] Tag image"
	@docker tag $(node_build_name) sudoo/$(node_build_name)

push: build tag
	@echo "[Info] Push image"
	@docker push sudoo/$(image_alpine_node_yarn_name)

push-node-build: build-node-build tag-node-build
	@echo "[Info] Push image"
	@docker push sudoo/$(node_build_name)
