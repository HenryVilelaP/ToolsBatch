ipconfig /Release
ipconfig /flushdns
ipconfig /Renew
ipconfig /RegisterDns

netsh winsock reset catalog
netsh int ipv4 reset reset.log
netsh int ipv5 reset reset.log
netsh int ip reset