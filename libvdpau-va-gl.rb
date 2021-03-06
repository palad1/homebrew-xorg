class LibvdpauVaGl < Formula
  desc "VDPAU driver for hardware that supports VAAPI"
  homepage "http://people.freedesktop.org/"
  url "https://github.com/i-rinat/libvdpau-va-gl/releases/download/v0.3.6/libvdpau-va-gl-0.3.6.tar.gz"
  sha256 ""

  # option "without-test", "Skip compile-time tests"

  # Build-time
  depends_on "pkg-config" => :build
  depends_on "cmake"      => :build
  depends_on "glib"       => :build
  depends_on "ffmpeg"     => :build # libswscale

  # Required
  depends_on "glu"
  depends_on "libva"
  depends_on "libvdpau"

  def install
    args = std_cmake_args
    args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    args << ".."

    (buildpath/"build").mkpath
    cd "build" do
      system "cmake", *args
      system "make"
      # system "make", "check" if build.with?("test") ### currently tests fail with:
      # X11 connection rejected because of wrong authentication
      system "make", "install"
    end
  end
end
