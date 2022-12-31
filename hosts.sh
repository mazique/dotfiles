Hosts

$ curl https://raw.githubusercontent.com/drduh/config/master/domains/ads | sudo tee -a /etc/hosts
$ curl https://someonewhocares.org/hosts/zero/hosts | sudo tee -a /etc/hosts
$ curl https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/gambling-hosts | sudo tee -a /etc/hosts
$ curl http://winhelp2002.mvps.org/hosts.txt | sudo tee -a /etc/hosts
$ curl https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts | sudo tee -a /etc/hosts
$ curl http://www.malwaredomainlist.com/hostslist/hosts.txt | sudo tee -a /etc/hosts
$ curl https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/snuff-hosts | sudo tee -a /etc/hosts
$ curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts | sudo tee -a /etc/hosts
$ curl https://raw.githubusercontent.com/l1k/osxparanoia/master/hosts | sudo tee -a /etc/hosts
$ wc -l /etc/hosts
65580

$ egrep -ve "^#|^255.255.255.255|^127.|^0.|^::1|^ff..::|^fe80::" /etc/hosts | sort | uniq | egrep -e "[1,2]|::"[No output]

#Setup tasks
$ sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false
$ brew install dnsmasq --with-dnssec
$ brew install dnscrypt-proxy
$ brew info dnscrypt-proxy

# Edit homebrew.mxcl.dnscrypt-proxy.plist in the dns crypt proxy location from info command
# listen_addresses = Change port to 5355 (xxx:5355)
$ sudo brew services restart dnscrypt-proxy

#Make sure running and encrypted
$ sudo lsof +c 15 -Pni UDP:5355
$ sudo tcpdump -qtni en0
$ dig +short -x 128.180.155.106.49321


Disable traffic ..??

$block drop quick on !lo0 proto udp from any to any port = 53
$ curl -o homebrew/etc/dnsmasq.conf https://raw.githubusercontent.com/drduh/config/master/dnsmasq.conf
$ sudo brew services start dnsmasq
$ sudo networksetup -setdnsservers "Wi-Fi" 127.0.0.1
$ scutil --dns | head
$ networksetup -getdnsservers "Wi-Fi"
$ dig +dnssec icann.org
$ dig www.dnssec-failed.org
$ brew install privoxy
$ brew services start privoxy
$ sudo networksetup -setwebproxy "Wi-Fi" 127.0.0.1 8118
$ sudo networksetup -setsecurewebproxy "Wi-Fi" 127.0.0.1 8118
$ scutil --proxy
$ ALL_PROXY=127.0.0.1:8118 curl -I http://p.p/
$ curl -o homebrew/etc/privoxy/config https://raw.githubusercontent.com/drduh/config/master/privoxy/config
$ curl -o homebrew/etc/privoxy/user.action https://raw.githubusercontent.com/drduh/config/master/privoxy/user.action
$ sudo brew services restart privoxy

$ ALL_PROXY=127.0.0.1:8118 curl ads.foo.com/ -IL
$ ALL_PROXY=127.0.0.1:8118 curl imgur.com/ -IL


For PGP encryption
$ curl -o ~/.gnupg/gpg.conf https://raw.githubusercontent.com/drduh/config/master/gpg.conf
