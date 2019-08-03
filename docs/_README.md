
[comment]: # (Редактируйте файл docs/_README.md)

# Разработка проекта Дискурс

[![Gitter](https://badges.gitter.im/Discours/community.svg)](https://gitter.im/Discours/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

> [Дискурс](https://discours.io) является проектом с открытым исходным кодом и каждый желающий может поучаствовать в его разработке.

{"gitdown": "contents", "maxLevel": 3}

:[Манифест](../MANIFEST.md)

### Архитектура проекта Дискурс

![Архитектура](docs/diagrams/Architecture.puml.png)

### Проекты

Проект | Технологический стэк | Цель | Статус
------ | -------------------- | ---- | -----
[discours-frontend-main](https://github.com/Discours/discours-frontend-main) | Typescript / React | Основной фронтэнд проект. | Не начат
discours-backend-main | ? | Основной бэкенд проект. | Не начат
discours-microservice-images | Python / Thumbor | Сервер (по факту голый [thumbor](https://github.com/thumbor/thumbor)), выдающий изображения в нужном фронтэнду размере и формате (`.webp` выдается автоматически, если браузер поддерживает этот формат). Изображения хранятся на S3. | Ожидает переноса в open source
discours-microservice-search | Java / Elasticsearch | Сервер поиска. Индексирует все статьи на сайте. Получает по HTTP обновления статей от основного бэкенда. Получает по HTTP запрос на поиск и ищет среди индексированного. | Ожидает переноса в open source
discours-microservice-rss | Python | При получении запроса идет на основной бэкэнд за данными и формирует xml файл в формате RSS. | Ожидает переноса в open source
discours-microservice-telegram | Go | Получает от бэкэнда новые статьи и отправляет подписчикам в Telegram. | Ожидает переноса в open source
discours-microservice-social-image | Python / Pillow | Генерирует для бэкэнда изображение, которое будет вставлено в страницу статьи как og:image. В дальнейшем планируется расширение сервиса для генерирования изображения из комментария. | Ожидает переноса в open source
discours-microservice-donate | ? | Микросервис, хранящий всю информацию по пожертвованиям. Имеет интеграцию с [Яндекс.Кассой](https://kassa.yandex.ru/developers/api) (для снятия legacy платежей, полученных до мая 2019) и [Cloudpayments](https://developers.cloudpayments.ru). | Не начат
discours-microservice-recommendations | ? | На основе куки пользователя + информации о логине генерирует 3 рекоммендуемых статьи к определенной статье. | Не начат