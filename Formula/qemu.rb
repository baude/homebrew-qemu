class Qemu < Formula
  desc "Emulator for x86 and PowerPC"
  homepage "https://www.qemu.org/"
  url "https://download.qemu.org/qemu-6.2.0.tar.xz"
  sha256 "68e15d8e45ac56326e0b9a4afa8b49a3dfe8aba3488221d098c84698bca65b45"
  license "GPL-2.0-only"
  head "https://git.qemu.org/git/qemu.git", branch: "master"

  bottle do
    rebuild 1
    sha256 arm64_monterey: "ebb70e2c067ed6b7675d2f3f58d994c70d5816bf43efcaffbb14c3b302486228"
    sha256 arm64_big_sur:  "f1be222ea617fbe9b897dcb60c54a90b0b5cdd86ea24322e47fd0e0473618b24"
    sha256 monterey:       "b3ad84cd4e4fd69606c4d4ed1423092e8bae32a7098ea51a29adcdebb55cb0f9"
    sha256 big_sur:        "eb508a74b42071dd0444d70dc90f854f63b6f79fe72d650c246dff8a86fb1d07"
    sha256 catalina:       "a4e9967cf7838e9642a8e38d3c0bcc4733270e4144fbb867f09311f06f415ad1"
    sha256 x86_64_linux:   "76787d26de9a128dd62506c1ecfcae3be118ce20b90a3427c9bceb4897bbb15d"
  end

  depends_on "libtool" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build

  depends_on "glib"
  depends_on "gnutls"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libslirp"
  depends_on "libssh"
  depends_on "libusb"
  depends_on "lzo"
  depends_on "ncurses"
  depends_on "nettle"
  depends_on "pixman"
  depends_on "snappy"
  depends_on "vde"

  on_linux do
    depends_on "gcc"
    depends_on "gtk+3"
  end

  fails_with gcc: "5"

  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/e0bd743bb2dd4985791d4de880446bdbb4e04fed.patch"
    sha256 "81b109dfc53a130c9f6fe58e57f4d9c9dc4d8b5acd51793d3d0dbc6a4209b696"
  end
  patch do
    url "https://raw.githubusercontent.com/baude/homebrew-qemu/3c5466c6aeb95ab528655f4711e495a497d548e5/remove_9p-util.patch"
    sha256 "ccf31a8e60ac7fc54fd287eca7e63fe1c9154e346d2a1367b33630227b88144d"
  end
  patch do
    url "https://raw.githubusercontent.com/baude/homebrew-qemu/3c5466c6aeb95ab528655f4711e495a497d548e5/add_9p-util-linux.patch"
    sha256 "e2835578eeea09b75309fc3ac4a040b47c0ac8149150d8ddf45f7228ab7b5433"
  end
  patch do
    url "https://raw.githubusercontent.com/ashley-cui/homebrew-podman/main/change.patch"
    sha256 "af8343144aea8b51852b8bf7c48f94082353c5e0c57d78fc61e7c3e4be3658b9"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/f41db099c71151291c269bf48ad006de9cbd9ca6.patch"
    sha256 "7ecf4c8173c52bbec3c5dab041be31572373998db036b4780f16a0212c71114a"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/6b3b279bd670c6a2fa23c9049820c814f0e2c846.patch"
    sha256 "25eb18c78db5b5d9a8cb8ddaae5848fcd8ace84acaf2d40ef6252a15f1211881"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/67a71e3b71a2834d028031a92e76eb9444e423c6.patch"
    sha256 "254de4d9077d62f0a805f28c9aa40dc3d709069f38cf692569e6f57b7ffbea18"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/38d7fd68b0c8775b5253ab84367419621aa032e6.patch"
    sha256 "e0f5c96c5a162a6f7a1625de468246e6d64abeb641acf4f9892d7e578cb9ef18"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/57b3910bc3513ab515296692daafd1c546f3c115.patch"
    sha256 "7a84fc442825ba20ab02c4564cfd3e82ff0c866b1f8fafccacc7551d7092bbae"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/b5989326f558faedd2511f29459112cced2ca8f5.patch"
    sha256 "fe914991ba2d7542bbc17e9d91bb7b94468a02b75e69c57df8d556ce7ae2cba9"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/029ed1bd9defa33a80bb40cdcd003699299af8db.patch"
    sha256 "b736e647a029314bc6968120c032bd9c2287a7ea75601b04850e1679e2cb7a1b"
  end
  patch do
    url "https://gitlab.com/qemu-project/qemu/-/commit/d3671fd972cd185a6923433aa4802f54d8b62112.patch"
    sha256 "e926beffaca09e12934b9bd2fad404696e33e1505ec3153fbc46edc11e971974"
  end
  patch do
    url "https://raw.githubusercontent.com/NixOS/nixpkgs/8fc669a1dd84ae0db237fdb30e84c9f47e0e9436/pkgs/applications/virtualization/qemu/allow-virtfs-on-darwin.patch"
    sha256 "61422ab60ed9dfa3d9fe8a267c54fab230f100e9ba92275bc98cf5da9e388cde"
  end

  # 820KB floppy disk image file of FreeDOS 1.2, used to test QEMU
  resource "homebrew-test-image" do
    url "https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.2/official/FD12FLOPPY.zip"
    sha256 "81237c7b42dc0ffc8b32a2f5734e3480a3f9a470c50c14a9c4576a2561a35807"
  end

  def install
    ENV["LIBTOOL"] = "glibtool"

    args = %W[
      --prefix=#{prefix}
      --cc=#{ENV.cc}
      --host-cc=#{ENV.cc}
      --disable-bsd-user
      --disable-guest-agent
      --enable-curses
      --enable-libssh
      --enable-slirp=system
      --enable-vde
      --enable-virtfs
      --extra-cflags=-DNCURSES_WIDECHAR=1
      --disable-sdl
    ]
    # Sharing Samba directories in QEMU requires the samba.org smbd which is
    # incompatible with the macOS-provided version. This will lead to
    # silent runtime failures, so we set it to a Homebrew path in order to
    # obtain sensible runtime errors. This will also be compatible with
    # Samba installations from external taps.
    args << "--smbd=#{HOMEBREW_PREFIX}/sbin/samba-dot-org-smbd"

    args << "--disable-gtk" if OS.mac?
    args << "--enable-cocoa" if OS.mac?
    args << "--enable-gtk" if OS.linux?

    system "./configure", *args
    system "make", "V=1", "install"
  end

  test do
    expected = build.stable? ? version.to_s : "QEMU Project"
    assert_match expected, shell_output("#{bin}/qemu-system-aarch64 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-alpha --version")
    assert_match expected, shell_output("#{bin}/qemu-system-arm --version")
    assert_match expected, shell_output("#{bin}/qemu-system-cris --version")
    assert_match expected, shell_output("#{bin}/qemu-system-hppa --version")
    assert_match expected, shell_output("#{bin}/qemu-system-i386 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-m68k --version")
    assert_match expected, shell_output("#{bin}/qemu-system-microblaze --version")
    assert_match expected, shell_output("#{bin}/qemu-system-microblazeel --version")
    assert_match expected, shell_output("#{bin}/qemu-system-mips --version")
    assert_match expected, shell_output("#{bin}/qemu-system-mips64 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-mips64el --version")
    assert_match expected, shell_output("#{bin}/qemu-system-mipsel --version")
    assert_match expected, shell_output("#{bin}/qemu-system-nios2 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-or1k --version")
    assert_match expected, shell_output("#{bin}/qemu-system-ppc --version")
    assert_match expected, shell_output("#{bin}/qemu-system-ppc64 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-riscv32 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-riscv64 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-rx --version")
    assert_match expected, shell_output("#{bin}/qemu-system-s390x --version")
    assert_match expected, shell_output("#{bin}/qemu-system-sh4 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-sh4eb --version")
    assert_match expected, shell_output("#{bin}/qemu-system-sparc --version")
    assert_match expected, shell_output("#{bin}/qemu-system-sparc64 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-tricore --version")
    assert_match expected, shell_output("#{bin}/qemu-system-x86_64 --version")
    assert_match expected, shell_output("#{bin}/qemu-system-xtensa --version")
    assert_match expected, shell_output("#{bin}/qemu-system-xtensaeb --version")
    resource("homebrew-test-image").stage testpath
    assert_match "file format: raw", shell_output("#{bin}/qemu-img info FLOPPY.img")
  end
end
