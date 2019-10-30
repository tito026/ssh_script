#!/usr/bin/expect -f
set timeout 20
set IPaddress [lindex $argv 0]
set Username "user"
set Password "password"
set Password_enable "pass"
set MAC "f800.4100.2200"
set Directory ~/github/ssh_script/logs
log_file -a $Directory/session_$IPaddress.log
send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
spawn ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc  $Username@$IPaddress
expect "*assword: "
send "$Password\r"
expect ">"
send "enable\r"
expect "*assword: "
send "$Password_enable\r"
expect "#"
send "show mac address-table address $MAC\r"
expect "#"
send "show interfaces status\r"
expect {
  -ex "--More--" { send -- " "; exp_continue }
  "*#" { send "exit\r" }
}
expect "#"
send "exit\r"
sleep 1
send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit
