# agi_dm01avso24_sogis 
Create Schema und Import Daten der AV

Git clonen:
```
  git clone https://github.com/bjsvwcur/arp_nutzungsvereinbarung.git
```

Docker Container erstellen mit 2 PostgreSQL DBs edit und Pub. Inkl. Schema agi_dm01avso24_sogis in beiden DBs.

```
  docker-compose down # (this command is optional; it's just for cleaning up any already existing DB containers)
  docker-compose run --rm --user $UID -v $PWD/development_dbs:/home/gradle/project gretl "sleep 20 && cd /home/gradle && gretl -b project/build-dev.gradle createSchemaLandUsePlans createSchemaLandUsePlansPub"
```

ENV Variablen auf die "Container"-DB setzen:
```
  export ORG_GRADLE_PROJECT_dbUriEdit="jdbc:postgresql://edit-db/edit"
  export ORG_GRADLE_PROJECT_dbUserEdit="gretl"
  export ORG_GRADLE_PROJECT_dbPwdEdit="gretl"
  export ORG_GRADLE_PROJECT_dbUriPub="jdbc:postgresql://pub-db/pub"
  export ORG_GRADLE_PROJECT_dbUserPub="gretl"
  export ORG_GRADLE_PROJECT_dbPwdPub="gretl"

```

mit ili2pg_4.3.1 Daten importieren (Verzeichnis zu ili2pg im File ili2pg_dataimportEdit_X.sh anpassen):
```
cd ./
./ili2pg_dataimportEdit_dm01avso24.sh
```

Daten von der Edit-DB in die Pub-DB kopieren
```
--  sudo -E $PWD/start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network agiavabgleich_default --job-directory $PWD/arp_nutzungsvereinbarung_pub/
  ```
