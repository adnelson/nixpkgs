{ stdenv, fetchFromGitHub, autoreconfHook, pkgconfig, udev, libusb }:

stdenv.mkDerivation rec {
  name = "hidapi-0.8.0-rc1";

  src = fetchFromGitHub {
    owner = "signal11";
    repo = "hidapi";
    rev = name;
    sha256 = "13d5jkmh9nh4c2kjch8k8amslnxapa9vkqzrk1z6rqmw8qgvzbkj";
  };

  buildInputs = [ autoreconfHook pkgconfig libusb ] ++ stdenv.lib.optional (stdenv.isLinux) udev;

  meta = with stdenv.lib; {
    homepage = https://github.com/signal11/hidapi;
    description = "Library for communicating with USB and Bluetooth HID devices";
    # Actually, you can chose between GPLv3, BSD or HIDAPI license (more liberal)
    license = licenses.bsd3;
    platforms = platforms.unix;
    maintainers = with maintainers; [ wkennington ];
  };
}
