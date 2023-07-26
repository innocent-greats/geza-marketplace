 git add .
 git commit -m "sync staging files"
 git pull
 sudo service  geza_api  restart
 sudo service nginx reload
 sudo systemctl daemon-reload