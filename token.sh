#!/bin/sh

token="\
-----BEGIN AGE ENCRYPTED FILE-----
YWdlLWVuY3J5cHRpb24ub3JnL3YxCi0+IHNjcnlwdCB6TVo3OVZJeHVNZGZsVXNE
ZW5wc2FBIDE4ClpqK2YvOGVhVGRMbGVEZXMyRnRsK0ZDUnA5QzB0RFZUZ1RYN05j
OTljTkkKLS0tIDhodTdiVDZERlNDdWhORzVHRlYvNlNWYStGUTczdDhJTVpUMnhQ
SjQ4STAK+TpjLHz26vqRFlHDl8scf/GBzWyTPMz1PL76k/x4uqsBkPJIvcLwivTu
l+8/7li08Bgay2P+kprjIcbLjGP8mWK0MtoU5TJTrIY74kODAJi4OktOt8Ufsbov
vulC3BNRm+HBI5lEh2oBr/fy16Cv/IYRlSglZ5qbRUFM/XVQTaOj3cm6GoumcIAp
GbvxQSBLija/Ako4xsxlv+y9qDuYoFVowdPxOldthhS0q8RTgGu1iQ==
-----END AGE ENCRYPTED FILE-----
"

mkdir --parents ~/.config/gh
echo "$token" | age --decrypt --output ~/.config/gh/hosts.yml
