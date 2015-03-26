{ appleDerivation, libsecurity_cdsa_utilities, libsecurity_utilities,
libsecurity_cdsa_plugin, libsecurity_asn1, apple_sdk, osx_private_sdk,
libsecurity_cdsa_utils }:

appleDerivation {
  buildInputs = [ libsecurity_cdsa_utilities libsecurity_utilities libsecurity_cdsa_plugin
  libsecurity_asn1 libsecurity_cdsa_utils ];

  NIX_CFLAGS_COMPILE = "-Iopen_ssl";

  patchPhase = ''
    for file in lib/BlockCryptor.h lib/RSA_DSA_signature.h lib/castContext.h \
      lib/RawSigner.h lib/MD2Object.h lib/HMACSHA1.h lib/bfContext.h lib/rc4Context.h; do
      substituteInPlace $file --replace \
        '"CoreServices/../Frameworks/CarbonCore.framework/Headers/MacTypes.h"' \
        '"${apple_sdk.sdk}/include/MacTypes.h"'
    done

    for file in lib/castContext.h lib/gladmanContext.h lib/desContext.h lib/rc4Context.h; do
      substituteInPlace $file --replace \
        '/usr/local/include/CommonCrypto/CommonCryptorSPI.h' \
        '${osx_private_sdk}/usr/include/CommonCrypto/CommonCryptorSPI.h'
    done

    substituteInPlace lib/opensshWrap.cpp --replace RSA_DSA_Keys.h RSA_DSA_keys.h
  '';
}
