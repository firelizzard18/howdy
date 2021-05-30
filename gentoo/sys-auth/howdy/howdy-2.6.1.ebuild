EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit python-r1

DESCRIPTION="Provides Windows Hello style authentication for Linux"
HOMEPAGE="https://github.com/boltgolt/howdy"
SRC_URI="https://github.com/boltgolt/howdy/archive/refs/tags/v${PV}.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda blas atlas lapack"

BDEPEND="dev-util/cmake"
RDEPEND="
    || ( net-misc/curl net-misc/wget )
    sys-libs/pam-python
    media-libs/opencv
	dev-python/numpy
	sci-libs/hdf5
    cuda? ( dev-util/nvidia-cuda-toolkit )
    blas? ( sci-libs/openblas )
    atlas? ( sci-libs/atlas )
    lapack? ( sci-libs/lapack )
"
DEPEND="${RDEPEND}"
