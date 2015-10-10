# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=automountnfs
pkgver=0.5.5
pkgrel=1
pkgdesc="Simple NFS mount handling for wireless hosts."
arch=('any')
license=('MIT')
url="https://github.com/demizer/automountnfs"
depends=('networkmanager')
source=('10-AutoMountNFS'
        'automountnfs'
        'AutoMountNFS.service'
        'AutoMountNFS.timer')
md5sums=('3dbfe5d654075bc4a61d0870aad066f9'
         'c0ae6e0f7a3507b4b5b179bdd00d0b4f'
         '6a211a227fa5ba65ae966656586761b8'
         '160a396c51e46660abe7a636698909d4')

package() {
    cd "${srcdir}"
    install -Dm755 automountnfs "${pkgdir}/usr/bin/automountnfs"
    install -Dm644 AutoMountNFS.service "${pkgdir}/usr/lib/systemd/system/AutoMountNFS.service"
    install -Dm644 AutoMountNFS.timer "${pkgdir}/usr/lib/systemd/system/AutoMountNFS.timer"
    install -Dm700 10-AutoMountNFS "${pkgdir}/etc/NetworkManager/dispatcher.d/10-AutoMountNFS"
}
