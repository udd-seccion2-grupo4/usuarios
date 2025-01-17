.DEFAULT_GOAL := run

.PHONY: build
build:
	@docker build -t mvn-udd .

.PHONY: run
run: build
	@docker run -it --rm -p 8888:8081 mvn-udd mvn spring-boot:run

.PHONY: bash
bash: build
	@docker run -it --rm mvn-udd bash

.PHONY: test
test: build
	@docker run -it --rm mvn-udd mvn test