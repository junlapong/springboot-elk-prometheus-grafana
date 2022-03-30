compose:
	@docker compose up -d

boot:
	@mvn -DskipTests clean spring-boot:run --projects movies-api

hey:
	@hey -c 10 -z 30s http://localhost:8080/api/movies

docker:
	@mvn clean compile jib:dockerBuild --projects movies-api

docker-native:
	@mvn clean spring-boot:build-image --projects movies-api

clean:
	@mvn clean
	@docker rmi ivanfranchin/movies-api:1.0.0
	@docker rmi springboot-elk-prometheus-grafana_filebeat:latest
