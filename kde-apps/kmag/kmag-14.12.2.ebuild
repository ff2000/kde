# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE screen magnifier"
HOMEPAGE="http://www.kde.org/applications/utilities/kmag/"
KEYWORDS=" ~amd64 ~x86"
IUSE="debug"

RDEPEND="
	$(add_kdeapps_dep kaccessible)
"
