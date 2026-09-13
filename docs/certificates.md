# Install Certificates

## Ubuntu

```sh
# copy root & intermediate to system trust and update the trust store
sudo cp private.crt private_intermediate_ca.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
```

## Firefox

Hase some problems using the system trust store when installed via snap.

```sh
# install the pkcs#11 wrapping library and command line tools
sudo apt install p11-kit p11-kit-modules

# fetch the location of the new security module
$ dpkg --listfiles p11-kit-modules | grep trust
/usr/lib/x86_64-linux-gnu/pkcs11/p11-kit-trust.so
```

in Firefox

- go to Settings -> Privacy & Security -> Security -> Security Devices.
- Then click “Load”,
  - in the popup window use “My local trust” as a module name,
  - `/usr/lib/x86_64-linux-gnu/pkcs11/p11-kit-trust.so` as a module filename.
  - After adding the module, you should see it in the list of Security Devices, having /etc/ssl/certs/ca-certificates.crt as a description.

- Reload Firefox and maybe delete website data if this does not work the first time

### Brave

Brave also uses it's own trust store. We have to add the root & intermediate certificates manually.

- visit brave://certificate-manager/localcerts/usercerts
  (Settings -> Privacy & Security -> Security -> Manage Certificates -> Local certificates -> Custom)
- import root certificate under `Trusted Certificates`
- import intermediate ca certificate under `Intermediate Certificates`

- Reload Brave and maybe delete the website data if this does not work the first time
