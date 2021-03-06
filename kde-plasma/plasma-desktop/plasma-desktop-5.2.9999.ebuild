# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="true"
inherit kde5

DESCRIPTION="KDE Plasma desktop"
KEYWORDS=""
IUSE="bluetooth +fontconfig networkmanager pulseaudio usb"

COMMON_DEPEND="
	$(add_plasma_dep breeze)
	$(add_plasma_dep kwin)
	$(add_plasma_dep oxygen kwin)
	$(add_plasma_dep plasma-workspace)
	$(add_frameworks_dep attica)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kemoticons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep krunner)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep solid)
	$(add_frameworks_dep sonnet)
	dev-qt/qtconcurrent:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	media-libs/phonon[qt5]
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcursor
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libxkbfile
	x11-libs/libXtst
	bluetooth? ( $(add_plasma_dep bluedevil) )
	fontconfig? (
		media-libs/fontconfig
		media-libs/freetype
		x11-libs/libXft
		x11-libs/xcb-util-image
	)
	networkmanager? ( $(add_plasma_dep plasma-nm) )
	pulseaudio? (
		dev-libs/glib:2
		media-libs/libcanberra
		media-sound/pulseaudio
	)
	usb? (
		x11-libs/libXcursor
		x11-libs/libXfixes
		virtual/libusb:0
	)
"
RDEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kded)
	$(add_plasma_dep kio-extras)
	dev-qt/qtgraphicaleffects:5
	sys-apps/accountsservice
	!kde-apps/kcontrol
	!kde-base/attica
	!kde-base/kcontrol
	!kde-base/kdepasswd
	!kde-base/knetattach[handbook]
	!kde-base/plasma-desktop
	!kde-base/plasma-workspace
	!kde-base/solid-actions-kcm
	!kde-base/systemsettings
"
DEPEND="${COMMON_DEPEND}
	x11-proto/xproto
	fontconfig? ( x11-libs/libXrender )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package fontconfig Fontconfig)
		$(cmake-utils_use_find_package pulseaudio PulseAudio)
		$(cmake-utils_use_find_package usb USB)
	)

	kde5_src_configure
}
