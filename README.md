# systemd-openconnect
This is a simple systemd unit file (service) to initialize Openconnect VPN connection on system startup, without any password prompts. Current example is used to connect to Juniper Network Connect / Pulse Secure SSL VPN (passing `--protocol=nc` to Openconnect). To use other protocols which Openconnect supports you might nwant to change this, as well as check what other options are needed specific to your protocol.

## Requirements
### Fedora
```
yum install -y stoken-cli openconnect
```

### Ubuntu
TBD

### Notes on compatibility
Works fine on Fedora 30, Ubuntu users might need to make a little tweak to it because of openconnect CLI args. For example, it worked on Ubuntu simply by changing `--protocol=nc` to `--juniper`).

## Security
You might think that connecting to VPN on start-up is not secure because anyone in posession of your laptop can hack your company's infrastructure. For this reason it is strongly recommended to encrypt your drive or (if you don't like the CPU overhead of full encryption) at least encrypt most sensitive files. I personally only store `.stokenrc` on an encrypted partition, and everything else is unencrypted. 
