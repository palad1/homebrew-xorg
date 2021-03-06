class Xwininfo < Formula
  desc "X.Org Applications: xwininfo"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7app.html
  url    "https://www.x.org/pub/individual/app/xwininfo-1.1.3.tar.bz2"
  mirror "http://ftp.x.org/pub/individual/app/xwininfo-1.1.3.tar.bz2"
  sha256 "218eb0ea95bd8de7903dfaa26423820c523ad1598be0751d2d8b6a2c23b23ff8"
  # tag "linuxbrew"

  depends_on "pkg-config" =>  :build
  depends_on "libxcb"
  depends_on "xcb-util-wm"
  # depends_on "libiconv" # currently does not compile under Linux

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --with-xcb-icccm
    ]
    # Add the line below to the list of args after fixint libiconv for linux
    #  --with-libiconv-prefix=#{Formula["libiconv"].prefix}

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
