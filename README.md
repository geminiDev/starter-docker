# STARTER DOCKER
_Starter pour mes projets web_

Une petite description du projet

## GET STARTED
---------------------

Ce projet contient 3 conteneurs :

- `httpd-server`    : Serveur WEB apache
- `php-server`      : Serveur PHP-FPM
- `pgsql-server`    : Serveur SGBD PostgreSQL

### REQUIRED
- DOCKER
- CentOS 8
- APACHE 2.4
- PHP et PHP-FPM
- NodeJS

### Installation
----------------
- [Installer docker sur votre ordinateur](https://docs.docker.com/desktop/)
- Récupérer le projet sur github.

### Executez les commandes suivantes:
-----------------
- `docker compose  --env-file ./docker.env build`

- `docker compose  --env-file ./docker.env up --force-recreate`

## Démarrage

Lancer le projet `http://localhost:80/` avec votre navigateur.

## Composants utilisés

Dans le cadre de ce projet, j'ai utilisé les composants.

_sources :_
* [Docker.com](https://www.docker.com/) - Solution Docker
* [Centos.org](https://www.centos.org/) - Linux CentOs
* [Php.net](https://www.php.net/) - PHP
* [Httpd.apache.org](https://httpd.apache.org/) - Serveur web
* [Postgresql.org](https://www.postgresql.org/) - Serveur SGBD

## Ressources documentaires

- [how-to-install-the-apache-web-server-on-centos-8-fr](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-centos-8-fr)
- [how-install-apache-centos-8](https://fr.joecomp.com/how-install-apache-centos-8)
- [apache-et-un-petit-peu-de-securite](https://technique.arscenic.org/lamp-linux-apache-mysql-php/apache-le-serveur-http/article/apache-et-un-petit-peu-de-securite)
- [image-docker-php-apache-parfaite](https://blog.silarhi.fr/image-docker-php-apache-parfaite/)
- [how-to-install-mod-ssl-on-redhat-8](https://linuxconfig.org/how-to-install-mod-ssl-on-redhat-8)

## License

MIT License
