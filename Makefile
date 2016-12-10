COMMON_NAME = mysql

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
PORTS = -p 3306:3306
ENV_VARS = -e MYSQL_ROOT_PASSWORD=hardcore_pw
# NET = --net=pstruch
VOLUMES = \
	-v /app/_mysql_data:/var/lib/mysql

.PHONY: build run stop inspect rm logs ports install test

build:
		docker build -t $(IMAGE) 8.0

run:
		docker run -d $(NET) --name $(NAME) $(ENV_VARS) $(PORTS) $(LINK) $(VOLUMES) $(IMAGE)	
		# docker run --rm -it $(NET) --name $(NAME) $(ENV_VARS) $(PORTS) $(LINK) $(VOLUMES) $(IMAGE)

install:
		docker run --rm -it $(NET) --name $(NAME) $(ENV_VARS) $(PORTS) $(LINK) $(VOLUMES) $(IMAGE) npm install --no-bin-links

test:
		docker exec -it $(NAME) npm test

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) bash

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)