How to configure/run it :

1. change permission prestart.sh = chmod +x prestart.sh
2. run prestart.sh with command = ./prestart.sh
    this script Install mongoDB, NVM and node v20 and create database explorerdb & create user with username and password
3. before start the process, change the RPC conenction at here
   - settings.json
   - lib/settings.js

change the "host", "port","username", "password"

4. change permission start.sh and run it ./start.sh ( this is run pm2 worker and website) or you can run by command
    npm run start-pm2
    npm run pm2-start-worker
5. now you can access the explorer on local network with port 3001

STOP the server
you can stop the service by command "npm run pm2-stop-all"

LOGS the server
you can stop the service by command "npm run logs"

REINDEX data
you can stop the service by command "npm run reindex"

CHANGE theme
open the settings.json and change "theme": "Zephyr" to others , then restart pm2 by command : "npm run reload-pm2"


NB : node must be running and open rpc connection to public, this is example : 

add this to your server digitalounce.conf setting
    
rpcuser=user
rpcpassword=changemeplease
rpcport=5555
rpcallowip=0.0.0.0/0
maxpeers=50
txindex=1
listen=1
server=1

