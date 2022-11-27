
FILE=.env
if [ -f "$FILE" ]; then
    echo "$FILE exists. Aborting"
else 
    echo "Creating $FILE, provide domain name."
    read DOMAIN

    AUTHENTIK_URL=auth.$DOMAIN
    MINIO_URL=media.$DOMAIN
    OUTLINE_URL=outline.$DOMAIN 

    echo "AUTHENTIK_URL=$AUTHENTIK_URL" >> .env
    echo "MINIO_URL=$MINIO_URL" >> .env
    echo "OUTLINE_URL=$OUTLINE_URL" >> .env

    echo "PG_PASS=$(pwgen -s 40 1)" >> .env
    echo "PG_PASS_OUTLINE=$(pwgen -s 40 1)" >> .env
    echo "PG_PASS_AUTHENTIK=$(pwgen -s 40 1)" >> .env
    echo "PG_USER=user" >> .env
    echo "AUTHENTIK_SECRET_KEY=$(pwgen -s 50 1)" >> .env
    echo "MINIO_ACCESS_KEY=$(pwgen -s 16 1)" >> .env
    echo "MINIO_SECRET_KEY=$(pwgen -s 64 1)" >> .env
fi
