class Wayland < Formula
  desc "Protocol for a compositor to talk to its clients"
  homepage "https://wayland.freedesktop.org"
  url "https://wayland.freedesktop.org/releases/wayland-1.11.0.tar.xz"
  sha256 "9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0"

  bottle do
    revision 1
    sha256 "b336ab9a676ed35cdd94593313fe0c730629284f17acffd7c3606f0ec82751d8" => :x86_64_linux
  end

  head do
    url "git://anongit.freedesktop.org/wayland/wayland"
  end

  option "with-static", "Build static libraries (not recommended)"
  option "without-test", "Skip compile-time tests"

  depends_on "pkg-config"  => :build
  depends_on "expat"
  depends_on "libffi"
  depends_on "autoconf" if build.head?
  depends_on "libxml2"

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --disable-documentation
    ]

    args << "--enable-static=#{build.with?("static") ? "yes" : "no"}"

    if build.head?
      system "./autogen.sh", *args
    else
      system "./configure", *args
    end
    system "make"
    ENV.deparallelize
    system "make", "check" if build.with?("test")
    system "make", "install"
  end
end
