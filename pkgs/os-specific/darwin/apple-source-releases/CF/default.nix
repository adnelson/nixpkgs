{ stdenv, appleDerivation, icu, dyld, libdispatch, launchd, libclosure, apple_sdk }:

appleDerivation {
  buildInputs = [ dyld icu libdispatch launchd libclosure ];

  patches = [ ./add-cf-initialize.patch ./add-cfmachport.patch ];

  preBuild = ''
    substituteInPlace Makefile \
      --replace "/usr/bin/clang" "clang" \
      --replace "-arch i386 " "" \
      --replace "/usr/bin/" "" \
      --replace "/usr/sbin/" "" \
      --replace "/bin/" "" \
      --replace "INSTALLNAME=/System" "INSTALLNAME=$out" \
      --replace "install_name_tool -id /System" "install_name_tool -id $out" \
      --replace "-licucore.A" "-licui18n -licuuc" \
      --replace 'chown -RH -f root:wheel $(DSTBASE)/CoreFoundation.framework' "" \
      --replace 'chmod -RH' 'chmod -R'

    replacement=''$'#define __PTK_FRAMEWORK_COREFOUNDATION_KEY5 55\n#define _pthread_getspecific_direct(key) pthread_getspecific((key))\n#define _pthread_setspecific_direct(key, val) pthread_setspecific((key), (val))'

    substituteInPlace CFPlatform.c --replace "#include <pthread/tsd_private.h>" "$replacement"

    substituteInPlace CFRunLoop.c --replace "#include <pthread/private.h>" ""

    substituteInPlace CFURLPriv.h \
      --replace "#include <CoreFoundation/CFFileSecurity.h>" "" \
      --replace "#include <CoreFoundation/CFURLEnumerator.h>" "" \
      --replace "CFFileSecurityRef" "void *" \
      --replace "CFURLEnumeratorResult" "void *" \
      --replace "CFURLEnumeratorRef" "void *"

    export DSTROOT=$out
  '';

  postInstall = ''
    cp ${apple_sdk.sdk}/Library/Frameworks/CoreFoundation.framework/Versions/A/Headers/CFAttributedString.h $out/System/Library/Frameworks/CoreFoundation.framework/Headers
    mv $out/System/* $out
    rmdir $out/System
  '';
}
