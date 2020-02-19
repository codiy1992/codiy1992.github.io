default:
	docker-compose up -d
bash:
	docker-compose run --rm jekyll /bin/bash
	docker-compose logs -f jekyll
stop:
	docker-compose down
