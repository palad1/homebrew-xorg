class XorgApps < Formula
  desc "X.Org Applications"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url "https://gist.githubusercontent.com/maxim-belkin/6916a35b777799d4e71b213eaae8a980/raw/974f263825c96a43310fca7a8106d0c7c015b681/README.md"
  version  "20160522"
  sha256   "d6f8969d76bd3236c40e57fc3f498c43341f3f1e9ae01c4c2bca11876f07adc6"
  # tag "linuxbrew"

  bottle :unneeded

  depends_on "bdftopcf"
  depends_on "iceauth"
  depends_on "luit"
  depends_on "mkfontdir"
  depends_on "mkfontscale"
  depends_on "sessreg"
  depends_on "setxkbmap"
  depends_on "smproxy"
  depends_on "x11perf"
  depends_on "xauth"
  depends_on "xbacklight"
  depends_on "xcmsdb"
  depends_on "xcursorgen"
  depends_on "xdpyinfo"
  depends_on "xdriinfo"
  depends_on "xev"
  depends_on "xgamma"
  depends_on "xhost"
  depends_on "xinput"
  depends_on "xkbcomp"
  depends_on "xkbevd"
  depends_on "xkbutils"
  depends_on "xkill"
  depends_on "xlsatoms"
  depends_on "xlsclients"
  depends_on "xmessage"
  depends_on "xmodmap"
  depends_on "xpr"
  depends_on "xprop"
  depends_on "xrandr"
  depends_on "xrdb"
  depends_on "xrefresh"
  depends_on "xset"
  depends_on "xsetroot"
  depends_on "xvinfo"
  depends_on "xwd"
  depends_on "xwininfo"
  depends_on "xwud"

  def install
    ohai "Xorg Applications have been installed!"
    prefix.install "README.md" => "xorg-apps.md"
  end
end
