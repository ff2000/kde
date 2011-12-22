# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

OPENGL_REQUIRED="always"
KDE_SCM="git"

USE_RUBY="ruby18"
# No ruby19 for three reasons:
# 1) it does not build (yet) - will likely be solved soon
# 2) cmake bails when configuring twice or more - solved with CMAKE_IN_SOURCE_BUILD=1
# 3) the ebuild can only be installed for one ruby variant, otherwise the compiled
#    files with identical path+name will overwrite each other - difficult :(

inherit kde4-base ruby-ng

DESCRIPTION="KDE Ruby bindings"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="akonadi debug kate okular semantic-desktop"

DEPEND="
	$(add_kdebase_dep qtruby)
	$(add_kdebase_dep smokekde 'akonadi?,kate?,okular?,semantic-desktop=')
	$(add_kdebase_dep smokeqt)
"
RDEPEND="${DEPEND}
"

# Split from kdebindings-ruby in 4.7
add_blocker kdebindings-ruby

pkg_setup() {
	ruby-ng_pkg_setup
	kde4-base_pkg_setup
}

src_unpack() {
	local S="${WORKDIR}/${P}"
	kde4-base_src_unpack

	cd "${WORKDIR}"
	mkdir all
	mv ${P} all/ || die "Could not move sources"
}

all_ruby_prepare() {
	kde4-base_src_prepare
}

each_ruby_configure() {
	CMAKE_USE_DIR=${S}
	mycmakeargs=(
		-DRUBY_LIBRARY=$(ruby_get_libruby)
		-DRUBY_INCLUDE_PATH=$(ruby_get_hdrdir)
		-DRUBY_EXECUTABLE=${RUBY}
		$(cmake-utils_use_with akonadi)
		$(cmake-utils_use_with akonadi KdepimLibs)
		$(cmake-utils_use_disable kate)
		$(cmake-utils_use_with okular)
		$(cmake-utils_use_with semantic-desktop Nepomuk)
		$(cmake-utils_use_with semantic-desktop Soprano)
	)
	kde4-base_src_configure
}

each_ruby_compile() {
	CMAKE_USE_DIR=${S}
	kde4-base_src_compile
}

each_ruby_install() {
	CMAKE_USE_DIR=${S}
	kde4-base_src_install
}
