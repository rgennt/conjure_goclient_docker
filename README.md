# conjure_goclient_docker

To see if client works at all check with default configuration first:
```
docker-compose up -d
curl -k https://127.0.0.1:10500
```
You should see a public IP address that does not belong to the host machine.  
Note: Sometimes client fails (`curl` just hangs), if this happens just terminate the process and try again

For example:

```
user@client:~/conjure_goclient_docker$ docker-compose up -d
Creating conjure_goclient_docker_client_1 ... done

user@client:~/conjure_goclient_docker$ curl -k https://127.0.0.1:10500
192.122.200.42
```


