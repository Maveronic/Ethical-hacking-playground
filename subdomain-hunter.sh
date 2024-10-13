#!/bin/bash

url=$1
if [ ! -d "$url" ];then
	mkdir $url
fi

if [ ! -d "$url/recon" ];then
	mkdir $url/recon
fi

echo "[+] Harvesting subdomains from assetfinder..."
assetfinder $url >> $url/recon/assets.txt
cat $url/recon/assets.txt | grep $1 >> $url/recon/subdomains.txt
rm $url/recon/assets.txt

echo "[+] Harvesting subdomains from Amass..."
amass enum -d $url >> $url/recon/subdomains.txt

echo "[+] Combining results..."
sort -u $url/recon/subdomains.txt
echo "[+] Done"
echo "[+] File located at: $url/recon/subdomains.txt"
echo "[+] Enjoy! "
