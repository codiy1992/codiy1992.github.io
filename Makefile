default:
	docker-compose up -d
	docker-compose logs -f jekyll
bash:
	docker-compose run --rm jekyll /bin/bash
stop:
	docker-compose down
