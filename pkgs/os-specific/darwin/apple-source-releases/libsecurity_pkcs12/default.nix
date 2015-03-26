{ appleDerivation, libsecurity_asn1, libsecurity_cdsa_utils, libsecurity_keychain,
libsecurity_cdsa_client }:

appleDerivation {
  patchPhase = ''
    substituteInPlace lib/pkcsoids.h --replace '#error' '#warning'
  '';

  preBuild = ''
    unpackFile ${libsecurity_keychain.src}
    mv libsecurity_keychain*/lib security_keychain
  '';

  buildInputs = [ libsecurity_asn1 libsecurity_cdsa_utils libsecurity_cdsa_client ];
}
