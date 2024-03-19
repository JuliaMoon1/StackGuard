## additional commands:

#### Restart fail2ban to apply any changes
```
sudo systemctl restart fail2ban
```
#### check status
``` 
systemctl status fail2ban
```
#### check active jails (default sshd)
```
fail2ban-client status
```
#### check status sshd
```
fail2ban-client status sshd
```
#### check logs
```
tail /var/log/fail2ban.log
```
#### stop service and disable
```
systemctl stop fail2ban && systemctl disable fail2ban
```

## additional parametrs in config
```
nano /etc/fail2ban/jail.local
```
bantime = 600
findtime = 3600
maxretry = 6

