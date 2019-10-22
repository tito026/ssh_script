#!/usr/bin/expect -f
	set timeout 20
	set IPaddress [lindex $argv 0]
	set Username "username"
	set Password "password"
	set Directory /home/Desktop/logs
	log_file -a $Directory/session_$IPaddress.log
send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
        spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress
	spawn ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc  $Username@$IPaddress 'show mac address-table address f80f.4188.229f'
        expect "*assword: "
        send "$Password\r"
        expect "#"
        send "conf t\r"
        expect "(config)#"
        send "int g0/0\r"
        expect "(config-if)#"
        send "shut\r"
        expect "(config-if)#"
        send "exit"
        expect "(config)#"
        send "exit"
        expect "#"
        send "wr mem\r"
        expect "#"
        send "exit\r"
        sleep 1
        send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit
Siddhartha
Siddhartha 
