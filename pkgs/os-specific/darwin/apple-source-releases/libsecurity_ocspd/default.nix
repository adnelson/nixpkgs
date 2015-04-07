{ appleDerivation, bootstrap_cmds, libsecurity_cdsa_utilities, libsecurity_utilities, osx_private_sdk }:
appleDerivation {
  buildInputs = [
    libsecurity_utilities
    libsecurity_cdsa_utilities
    bootstrap_cmds
  ];
  postUnpack = ''
    pushd libsecurity*
    mkdir lib
    cp common/* lib
    cp client/* lib
    popd
  '';
  preBuild = ''
    make -f mig/mig.mk SRCROOT=. BUILT_PRODUCTS_DIR=. || exit 1
    cp derived_src/* lib
  '';
}