# DTCC integration in Ruby for POV/FAR

DTCC only allows connection & data transmission via SFTP.

The bash script `get.sh` uses Unix's `sftp` to connect and place the text files inside of the `dtcc/data/outstanding` directory, ex:

```
send "cd //!DTS3.DOWN.C8336\n"
expect "sftp>"
send "lcd ~/dtcc/data/outstanding\n"
expect "sftp>"
send "mget * \n
```

**Note: the directory to `cd` into will be different for your setup**

The commands in the bash script `cd` into the DTCC directory and place them in the server's local directory for DTCC data.

The `run.rb` script is where the magic happens.

Running `ruby run.rb` will take the files in the `dtcc/data/outstanding` directory and iterate over each one, parsing the files based on the defined spacing.  It will then convert the data into a ruby hash, and organize the Ruby hash into an array of hashes each being for an individual policy.

Finally, it takes the Ruby data structure and converts it to JSON, ex:

```ruby
[
	'1301' => {
    	'Contract Number' => '123456789',
        'Another Field' => '...'
    },
    '1302' => {
    	'Contract Number' => '123456789',
        'This Field' => '...'
    }
]
````
