#!/bin/bash

add_repo_key_file()
{
cat <<PUBKEY_EOF >>$APPPATH/softmaker.repository.gpg
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQENBFpOLj4BCAC8XZffd/y5zonHkCFswGagKUO4dYo0VTpHouHo3aShVpw4J/Xh
EHzmMuFN7gAt1wa/mnp8k3gZkj1SvcY/nnFxGE/8SL6nuUzZY8yUbuTP8xkp31U+
kQUpBCefip2ZHdFg3bYMGkWDDVm0cMo7nD1rznNN8GSC8UU8Y6YFrodUc/WIpgEo
GqbS3opFgwMBdrt/+wWTz4/+N5tC4HQXG2IMoC4fodydQu+6iN+cgZVibpJeRybW
rQkmMJAUydBy+o3CRhIE8yFnaJ4mWZieZQy78sWw5bZPFHjg3kOEIxSncFaYHfWY
otRGbQlenA4ij9pqyAJtqBT4LqBET2FHqcmJABEBAAG0RVNvZnRNYWtlciByZXBv
c2l0b3J5IChHUEcga2V5IGZvciBzaWduaW5nIGZpbGVzKSA8aW5mb0Bzb2Z0bWFr
ZXIuY29tPokBOAQTAQIAIgUCWk4uPgIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgEC
F4AACgkQNBPamKo+f14imQf+PwJOZwTS+3zVQRjBgPjtxSdsOcONnjNhvYoe3N+v
NQZZMOlksndviM7AMB7kcYV5NWiawYvvbg7knpsMdgMzvToB0CpKQ/K7oy8kAq0O
HdtA1HwV/23ExH+EcAtCZnzD8YopRXlcoN6hGG4GkDzSf/Rnj4b6ImtKVBcy0R43
BbbL6cMFJj3Gw51MoxR9ZXBV4job+9T3pt7rCb1mnq4x8ocCLvtT7vgs0QnwC+Pb
PgHXHHTYKcFeoZf3IrGx9ZcMKCbShC0LQv5Kn8PiQZXgIf24RQvp4ib1XO1lY38W
3q4VvxvJIxkmbjGnADwUaESz/hP8I0j5OIVM5Uefb/k0oQ==
=YG9D
-----END PGP PUBLIC KEY BLOCK-----
PUBKEY_EOF
}

add_deb_repo()
{
	if [ -d /etc/apt/sources.list.d ] ; then
		echo "APT repository directory found."
	else
		echo "Cannot find APT repository directory! Exiting."
		exit 1
	fi
	
	echo Adding the SoftMaker repository to keep SoftMaker Office up to date...
	cat <<REPO_DEB_EOF >/etc/apt/sources.list.d/softmaker.list
#SoftMaker Office repository
deb http://shop.softmaker.com/repo/apt wheezy non-free
REPO_DEB_EOF

	add_repo_key_file
	echo "Importing the key for the SoftMaker repository..."
	apt-key add $APPPATH/softmaker.repository.gpg 2>/dev/null
}

if [[ $(id -u) -ne 0 ]] ; then
	echo "Please run the script with root permissions!"
	exit 1
fi

APPPATH=`dirname $0`
add_deb_repo
echo "All done!"
exit 0

