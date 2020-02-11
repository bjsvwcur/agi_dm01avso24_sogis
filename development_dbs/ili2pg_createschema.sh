java -jar /home/bjsvwcur/ilis/ili2pg-4.3.1/ili2pg.jar \
--dbschema arp_nutzungsvereinbarung_pub --models SO_ARP_Nutzungsvereinbarung_Publikation_20170223 \
--defaultSrsCode 2056 --strokeArcs --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createUnique --createNumChecks --nameByTopic \
--createscript arp_nutzungsvereinbarung_pub.sql
