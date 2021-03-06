# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
KDE_SELINUX_MODULE="games"
inherit kde4-base

DESCRIPTION="Mahjongg for KDE"
HOMEPAGE="
	http://www.kde.org/applications/games/kmahjongg/
	http://games.kde.org/game.php?game=kmahjongg
"
KEYWORDS=""
IUSE="debug"

DEPEND="
	$(add_kdeapps_dep libkdegames)
	$(add_kdeapps_dep libkmahjongg)
"
RDEPEND="${DEPEND}"
