# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
inherit flag-o-matic kde4-base

DESCRIPTION="KDE Desktop Planetarium"
HOMEPAGE="http://www.kde.org/applications/education/kstars http://edu.kde.org/kstars"
KEYWORDS=""
IUSE="debug fits indi"

DEPEND="
	dev-cpp/eigen:3
	$(add_kdebase_dep libkdeedu)
	fits? ( >=sci-libs/cfitsio-0.390 )
	indi? ( >=sci-libs/indilib-0.9.1 )
"
RDEPEND="${DEPEND}"

src_configure() {
	# Bug 308903
	use ppc64 && append-flags -mminimal-toc

	mycmakeargs=(
		$(cmake-utils_use_with fits CFitsio)
		$(cmake-utils_use_with indi)
	)

	kde4-base_src_configure
}
