# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=automountnfs
pkgver=0.7.10
pkgrel=1
pkgdesc="Simple NFS mount handling for wireless hosts."
arch=('any')
license=('MIT')
url="https://github.com/demizer/automountnfs"
depends=('networkmanager')
source=('10-automountnfs'
        'automountnfs'
        'automountnfs.service'
        'automountnfs-check.service'
        'automountnfs-check.timer')
md5sums=('5c03f13514b1e7fe2718723dbd7bdba8'
         '0fc84c6411f032a93464ab32df28d7db'
         '03d18023f266849b5c8aeb2c02eb0e81'
         'a8b53727cb514228d1738dd3d25ecfbe'
         '719b1271639e0e9a501a459692d9ad73')

package() {
    cd "${srcdir}"
    install -Dm755 automountnfs "${pkgdir}/usr/bin/automountnfs"
    install -Dm644 automountnfs.service "${pkgdir}/usr/lib/systemd/system/automountnfs.service"
    install -Dm644 automountnfs-check.service "${pkgdir}/usr/lib/systemd/system/automountnfs-check.service"
    install -Dm644 automountnfs-check.timer "${pkgdir}/usr/lib/systemd/system/automountnfs-check.timer"
    install -Dm700 10-automountnfs "${pkgdir}/etc/NetworkManager/dispatcher.d/10-automountnfs"
}
