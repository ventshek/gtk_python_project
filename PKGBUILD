# Maintainer: George Williams <ventshek@gmail.com>
pkgname=term_erm
pkgver=0.0.1
pkgrel=1
pkgdesc="Terminal and bash editor."
arch=('x86_64')
url="https://github.com/ventshek/term_erm.git"
license=('GPL')
depends=(python gtk3 vte3)
makedepends=(git make python-build python-installer python-wheel cython)
optdepends=('sudo: Give certain users the ability to run some commands as root.'
            'doas: A port of OpenBSDs doas, an alternative to sudo.')
provides=(term_erm)
install="script.sh"
source=("git+$url")
#noextract=()
md5sums=('SKIP')
build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
    cython main.py --embed
}
package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    PYTHONLIBVER=python$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')$(python3-config --abiflags)
    gcc -Os $(python3-config --includes) main.c -o /tmp/"$pkgname" $(python3-config --ldflags) -l$PYTHONLIBVER
    install -Dm755 /tmp/"$pkgname" "$pkgdir/usr/bin/$pkgname"
}