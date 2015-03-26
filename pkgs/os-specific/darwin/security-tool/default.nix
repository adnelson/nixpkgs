{ stdenv, fetchurl, gnustep-make, Security, Foundation, libsecurity_asn1,
libsecurity_utilities, libsecurity_cdsa_utilities, libobjc, CoreServices,
libsecurity_cdsa_client, libsecurity_keychain, libsecurity_cssm, apple_sdk,
libsecurity_cdsa_utils, libsecurity_mds, libsecurity_cdsa_plugin, libsecurity_apple_csp,
libsecurity_apple_cspdl, PCSC, libsecurity_apple_file_dl, libsecurity_apple_x509_cl,
libsecurity_apple_x509_tp, libsecurity_pkcs12 }:

stdenv.mkDerivation rec {
  version = "55115";
  name    = "SecurityTool-${version}";

  src = fetchurl {
    url = "http://opensource.apple.com/tarballs/SecurityTool/SecurityTool-${version}.tar.gz";
    sha256 = "0apcz4vy2z5645jhrs60wj3w27mncjjqv42h5lln36g6qs2n9113";
  };

  __impureHostDeps = [
    "/usr/lib/libextension.dylib"
    "/System/Library/Frameworks/PCSC.framework/Versions/A/PCSC"
  ];

  patchPhase = ''
    substituteInPlace cmsutil.c --replace \
      '<CoreServices/../Frameworks/CarbonCore.framework/Headers/MacErrors.h>' \
      '"${apple_sdk.sdk}/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/MacErrors.h"'
    substituteInPlace createFVMaster.c --replace \
      '<CoreServices/../Frameworks/CarbonCore.framework/Headers/MacErrors.h>' \
      '"${apple_sdk.sdk}/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/MacErrors.h"'
  '';

  postUnpack = ''
    unpackFile ${Security.src}
    cp Security-*/utilities/src/fileIo.c SecurityTool*
    cp Security-*/utilities/src/fileIo.h SecurityTool*
  '';

  preBuild = ''
    makeFlagsArray=(-j$NIX_BUILD_CORES)
  '';

  NIX_LDFLAGS = "-no_dtrace_dof";

  makeFlags = "-f ${./GNUmakefile} MAKEFILE_NAME=${./GNUmakefile}";

  installFlags = [ "security_INSTALL_DIR=$(out)/bin" ];

  dontStrip = true;

  buildInputs = [ gnustep-make Security Foundation libsecurity_asn1 libsecurity_utilities
  libsecurity_cdsa_utilities libobjc libsecurity_cdsa_client libsecurity_keychain
  libsecurity_cssm libsecurity_cdsa_utils libsecurity_mds libsecurity_cdsa_plugin
  libsecurity_apple_csp libsecurity_apple_cspdl libsecurity_apple_file_dl
  libsecurity_apple_x509_cl libsecurity_apple_x509_tp libsecurity_pkcs12 ];

  NIX_CFLAGS_COMPILE = [
    "-F${Security}/Library/Frameworks"
    "-F${PCSC}/Library/Frameworks"
    "-Wno-deprecated-declarations"
    "-g"
  ];

  meta = with stdenv.lib; {
    description = "Command line interface to Mac OS X keychains and Security framework";
    maintainers = with maintainers; [ copumpkin joelteon ];
    platforms   = platforms.darwin;
    license     = licenses.apsl20;
  };
}
