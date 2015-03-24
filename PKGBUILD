# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=automountnfs
pkgver=0.4.3
pkgrel=1
pkgdesc="Simple NFS mount handling for wireless hosts."
arch=('any')
license=('MIT')
url="https://github.com/demizer/automountnfs"
depends=('networkmanager')
source=('10-AutoMountNFS'
        'automountnfs'
        'AutoMountNFS.service')
md5sums=('3dbfe5d654075bc4a61d0870aad066f9'
         '7172e8e58405cdcc0b32ab3300a4dd1a'
         'd94adc285d42eb7a2a994d7bba7ea1b0')

package() {
    cd "${srcdir}"
    install -Dm755 automountnfs "${pkgdir}/usr/bin/automountnfs"
    install -Dm644 AutoMountNFS.service "${pkgdir}/usr/lib/systemd/system/AutoMountNFS.service"
    install -Dm700 10-AutoMountNFS "${pkgdir}/etc/NetworkManager/dispatcher.d/10-AutoMountNFS"
}
