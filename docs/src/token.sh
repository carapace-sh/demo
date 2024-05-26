#!/bin/sh

token="\
-----BEGIN AGE ENCRYPTED FILE-----
YWdlLWVuY3J5cHRpb24ub3JnL3YxCi0+IHNjcnlwdCB6bk85RzJQdWRKTWZxWThl
RlN1TFhRIDE4Ck1MM3l0Q3dGU1hCNHlLZ0RrY1M2YncwS01QQ1dDVGtGM0tNc1hn
TnVxd0EKLS0tIExLeDBlZGdGYjNmbEpJWUJWR1hBeXVnWU1IVHY0ditOUlE5YTY2
N3hhdWMKBsp4aZDjdIHrOT1yZNaK9j8LL+tH8SeKwT8xLBzPUAy8LmD47A66SJEK
jay4uHr/osz403OQIwUbHARsd90WqAQTmZNICxdc1SBhuLivBzx2VoX2j/6KuU2T
w3Kn1/aH1x3o+PeqZWzEfmx1UsA9/VavOW+K4NV+w7ginATATe8z9fIv5ekTn3cP
/MwDxGfdfoDwv3Gd5dXKpAg43eROselYPuuX08Qb+Fat+Zs=
-----END AGE ENCRYPTED FILE-----
"

mkdir --parents ~/.config/gh
echo "$token" | age --decrypt --output ~/.config/gh/hosts.yml
