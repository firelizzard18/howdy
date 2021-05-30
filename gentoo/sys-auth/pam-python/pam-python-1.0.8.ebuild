EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Support for PAM modules written in Python"
HOMEPAGE="http://pam-python.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/project/pam-python/pam-python-${PV}-1/pam-python-${PV}.tar.gz"
BUILD_DIR=src

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="dev-util/cmake dev-python/sphinx"
RDEPEND="sys-libs/pam"
DEPEND="${RDEPEND}"

python_prepare_all() {
    eapply ${FILESDIR}/${P}_fix-py3.patch
    eapply ${FILESDIR}/${PN}_fix-test.patch
    sed -i'' 's|LIBDIR ?= /lib/security|LIBDIR ?= /usr/lib/security|g' src/Makefile
    sed -n '/^License/,/^--$/p' README.txt | grep -v -e '^License' -e '^-\+' > src/LICENSE
	distutils-r1_python_prepare_all
}

src_compile() {
    WARNINGS="-Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Werror"
    export CFLAGS="${CFLAGS} ${WARNINGS} -I/usr/local/lib/ "

    pushd "$BUILD_DIR"
    distutils-r1_src_compile
    popd
}

src_install() {
    pushd "$BUILD_DIR"
    distutils-r1_src_install
    popd
}