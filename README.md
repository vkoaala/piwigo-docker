docker-piwigo
=============

A docker container for Piwigo
Now contains ffmpeg and mediainfo

Recommended use:

    # Create a volume image for mysql
    docker run --name mysql-piwigo-data -d mysql false
    # Create a volume image for piwigo
    docker run -d --name piwigo-data hg8496/piwigo false
    # Launch the mysql container
    docker run --volumes-from mysql-piwigo-data --name mysql-piwigo -e MYSQL_USER=piwigo -e MYSQL_PASSWORD=piwigo -e MYSQL_DATABASE=piwigo -e MYSQL_ROOT_PASSWORD=toor -d mysql
    # Lauch the piwigo container
    docker run -d --volumes-from piwigo-data --link mysql-piwigo:mysql -p 80:80 hg8496/piwigo

Then go to to `http://<server>` and you should see the piwigo installpage. From there use `mysql` as database host and `piwigo` as `user`, `password` and `database`.

