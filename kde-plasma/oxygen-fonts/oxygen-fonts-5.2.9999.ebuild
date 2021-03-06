# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_AUTODEPS="false"
inherit kde5 font

DESCRIPTION="Desktop/GUI font family for integrated use with the KDE desktop"
HOMEPAGE="https://projects.kde.org/projects/kde/workspace/oxygen-fonts"

LICENSE="OFL-1.1"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/extra-cmake-modules
	media-gfx/fontforge
"
RDEPEND="!media-fonts/oxygen-fonts"

src_configure() {
	local mycmakeargs=(
		-DOXYGEN_FONT_INSTALL_DIR="${FONTDIR}"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	font_src_install
}
