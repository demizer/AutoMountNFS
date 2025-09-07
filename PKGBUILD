# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=automountnfs
pkgver=0.7.0
pkgrel=1
pkgdesc="Simple NFS mount handling for wireless hosts."
arch=('any')
license=('MIT')
url="https://github.com/demizer/automountnfs"
depends=('networkmanager')
source=('10-AutoMountNFS'
        'automountnfs'
        'AutoMountNFS.service'
        'AutoMountNFS-check.service'
        'AutoMountNFS-check.timer')
md5sums=('d24dcc16e952e079cce8fbc0194d0531'
         '4e45e5eab512262f41ad66e5f55b5845'
         'e7c165e85de84a9be7a982932ffc4132'
         'a8b53727cb514228d1738dd3d25ecfbe'
         '385306da45c700ea82e5390274088cf0')

package() {
    cd "${srcdir}"
    install -Dm755 automountnfs "${pkgdir}/usr/bin/automountnfs"
    install -Dm644 AutoMountNFS.service "${pkgdir}/usr/lib/systemd/system/AutoMountNFS.service"
    install -Dm644 AutoMountNFS-check.service "${pkgdir}/usr/lib/systemd/system/AutoMountNFS-check.service"
    install -Dm644 AutoMountNFS-check.timer "${pkgdir}/usr/lib/systemd/system/AutoMountNFS-check.timer"
    install -Dm700 10-AutoMountNFS "${pkgdir}/etc/NetworkManager/dispatcher.d/10-AutoMountNFS"
}
