# Linux DevOps project

This code allows to install popular hardware-scanning programs, learn basic information about remote hosts and send it to a specific email address.

The login and password for an email account are safely stored in a file secret.yml using encryption.

To use the script, you should specify your SMTP server configuration, sender email and ports should be specified at file send.yml.
 Also, you should store your email password in file credentials.yml using the command ```ansible-vault create secret.yml```.

 
The code installs necessary applications, collects information about OS, users, hardware, network and sends it.


