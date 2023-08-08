install:
	#install commands
	pip install --upgrade pip &&\
	pip install -r requirements.txt

post-install:
	python -m textblob.download_corpora

format:
	#format code
	black *.py mylib/*.py

lint:
	#flake8 or #pylint
	pylint --disable=R,C *.py mylib/*.py

test:
	#test
	python -m pytest -vv --cov=mylib test_logic.py test_main.py

build:
	#build container
	docker build -t deploy-fastapi .

run:
	#docker run -p 127.0.0.1:8080:8080 6857056eae51

deploy:
	#deploy
	aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 103629660136.dkr.ecr.ap-southeast-1.amazonaws.com
	docker build -t wiki .
	docker tag wiki:latest 103629660136.dkr.ecr.ap-southeast-1.amazonaws.com/wiki:latest
	docker push 103629660136.dkr.ecr.ap-southeast-1.amazonaws.com/wiki:latest
	
all: install lint test deploy