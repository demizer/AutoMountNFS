# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=automountnfs
pkgver=0.6.7
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
         '2076fcf09820a50e26bb56ff960e9b24'
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
