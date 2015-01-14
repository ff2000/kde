# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="${PN}-1"
inherit kde5

DESCRIPTION="PolKit agent module for KDE"
HOMEPAGE="http://www.kde.org"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="5"
IUSE=""

DEPEND="
	>=sys-auth/polkit-qt-0.112.0
"
RDEPEND="${DEPEND}
	!sys-auth/polkit-kde
	!sys-auth/polkit-kde-agent:5
"