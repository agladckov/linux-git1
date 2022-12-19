# Linux DevOps project

This code allows to install popular hardware-scanning program hwinfo, learn basic information about remote hosts and send it to a specific email address.

The login and password for an email account are safely stored in a file ```secret.yml``` using encryption.

## Details

To use the script, you should specify your SMTP server configuration, sender email and ports at file ```send.yml```.
Also, you should write down your email password in ```secret.yml``` using the command ```ansible-vault create secret.yml``` and set up a password for it.

The code reports about host's time, basic network, CPU, RAM facilities and sends it using specified email.
Sample output can be seen at ```send.txt```.
