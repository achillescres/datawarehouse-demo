# Data Lake (Iceberg + Nessie + MinIO + Spark + Trino) — Docker Compose

## Стек

* **MinIO** — S3-хранилище
* **Iceberg** — таблицы в data lake
* **Nessie** — versioned catalog (REST)
* **Spark** — обработка/ETL
* **Trino** — SQL-запросы
* **Hadoop YARN + HDFS** — запуск Spark под управлением YARN

## Запуск

```bash
docker compose up -d
```

## Доступ

* MinIO Console: `http://localhost:9001` (логин `admin`, пароль `password`)
* Nessie: `http://localhost:19120`
* Trino: `http://localhost:8080`

## MinIO bucket

Контейнер `mc` автоматически создаёт bucket:

* `s3://iceberg/`

## Spark

Конфиг Spark: `./spark/spark-defaults.conf`
Содержит Iceberg + Nessie extensions и настройки доступа к MinIO.

Запуск Spark в standalone (если включены `spark-master/worker`):

```bash
docker compose exec spark-master bash
# затем spark-submit / spark-shell
```

## Trino

Trino конфиги лежат в:

* `./trino/coordinator/`
* `./trino/worker/`
* `./trino/catalog/iceberg.properties`

Проверка из coordinator:

```bash
docker compose exec trino-coordinator trino --server http://localhost:8080
```

## Spark на YARN

```bash
spark-submit --master yarn ...
```
или через docker exec
## Остановка

```bash
docker compose down
```

Полная очистка (удаляет volumes и данные):

```bash
docker compose down -v
```

---
