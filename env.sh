
FILE=.env
if [ -f "$FILE" ]; then
    echo "$FILE exists. Aborting"
else 
    echo "Creating $FILE, provide domain name."
    read DOMAIN

    AUTHENTIK_URL=auth.$DOMAIN
    MINIO_URL=media.$DOMAIN
    OUTLINE_URL=outline.$DOMAIN

    PG_PASS=$(pwgen -s 40 1)
    AUTHENTIK_SECRET_KEY=$(pwgen -s 50 1)
    MINIO_ACCESS_KEY=$(pwgen -s 16 1)
    MINIO_SECRET_KEY=$(pwgen -s 64 1)

    echo "AUTHENTIK_URL=$AUTHENTIK_URL" >> .env
    echo "MINIO_URL=$MINIO_URL" >> .env
    echo "OUTLINE_URL=$OUTLINE_URL" >> .env

    echo "PG_PASS=$PG_PASS" >> .env
    echo "PG_PASS_OUTLINE=$PG_PASS" >> .env
    echo "PG_PASS_AUTHENTIK=$PG_PASS" >> .env
    echo "PG_USER=user" >> .env
    echo "AUTHENTIK_SECRET_KEY=$AUTHENTIK_SECRET_KEY" >> .env
fi
