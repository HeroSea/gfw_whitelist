
cd /tmp
wget -q --no-check-certificate https://github.com/n0wa11/gfw_whitelist/raw/master/whitelist.pac -O whitelist.txt
sed -i .bak 's/ //g' whitelist.txt        
grep '^"\.' whitelist.txt > whitelist.tmp 
echo 'converting whitelist to domain list...'
sed -i .bak 's/^"\.//g' whitelist.tmp   
sed -i .bak 's/\/.*$//g' whitelist.tmp     
sed -i .bak 's/\"//g' whitelist.tmp    
sed -i .bak 's/\,//g' whitelist.tmp     
sort whitelist.tmp | uniq > dnswhitelist.txt
sed -i .bak -e "s/.*/server=\/&\/218.108.248.228/" dnswhitelist.txt
rm whitelist.*