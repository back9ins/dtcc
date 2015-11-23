#!/usr/bin/expect -f
spawn sftp user@ip
expect "Password:"
send "Password\n"
expect "sftp>"
send "cd //!DTS3.DOWN.C8336\n"
expect "sftp>"
send "lcd ~/dtcc/data/outstanding\n"
expect "sftp>"
send "mget * \n"
expect "sftp>"
send "exit\n"
interact


