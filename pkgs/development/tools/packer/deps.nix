{ stdenv, lib, gox, gotools, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "packer-${version}";
  version = "20160507-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "4e5f65131b5491ab44ff8aa0626abe4a85597ac0";

  buildInputs = [ gox gotools ];
  
  goPackagePath = "github.com/mitchellh/packer";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/mitchellh/packer";
    sha256 = "1a61f022h4ygnkp1lyr7vhq5w32a3f061dymgkqmz4c3b8fzcc10";
  };

  extraSrcs = [
    {
      goPackagePath = "github.com/ActiveState/tail";

      src = fetchgit {
        url = "https://github.com/ActiveState/tail";
        rev = "1a0242e795eeefe54261ff308dc685f7d29cc58c";
        sha256 = "0hhr2962xmbqzbf2p79xfrzbmjm33h61fj5zlazj7a55bwxn688d";
      };
    }
    {
      goPackagePath = "github.com/Azure/azure-sdk-for-go";

      src = fetchgit {
        url = "https://github.com/Azure/azure-sdk-for-go";
        rev = "a1883f7b98346e4908a6c25230c95a8a3026a10c";
        sha256 = "0pxqi0b8qwcc687si3zh6w1d594rxd6kn2wzx23clbp2nc5w3wf4";
      };
    }
    {
      goPackagePath = "github.com/Azure/go-autorest";

      src = fetchgit {
        url = "https://github.com/Azure/go-autorest";
        rev = "b01ec2b60f95678fa759f796bac3c6b9bceaead4";
        sha256 = "1vqwy4m26ps5lmp066zgiz04s7r2dwa832zjlfmpgha7id16pa0c";
      };
    }
    {
      goPackagePath = "github.com/Azure/go-ntlmssp";

      src = fetchgit {
        url = "https://github.com/Azure/go-ntlmssp";
        rev = "e0b63eb299a769ea4b04dadfe530f6074b277afb";
        sha256 = "19bn9ds12cyf8y3w5brnxwg8lwdkg16ww9hmnq14y2kmli42l14m";
      };
    }
    {
      goPackagePath = "github.com/armon/go-radix";

      src = fetchgit {
        url = "https://github.com/armon/go-radix";
        rev = "4239b77079c7b5d1243b7b4736304ce8ddb6f0f2";
        sha256 = "0md8li1gv4ji4vr63cfa2bcmslba94dzw6awzn5ndnpmdb7np6vh";
      };
    }
    {
      goPackagePath = "github.com/aws/aws-sdk-go";

      src = fetchgit {
        url = "https://github.com/aws/aws-sdk-go";
        rev = "8041be5461786460d86b4358305fbdf32d37cfb2";
        sha256 = "06ilyl1z5mn6i0afd8ila4lr2vwqdgq5zby8v4v2g3dd39qi6jq2";
      };
    }
    {
      goPackagePath = "github.com/bgentry/speakeasy";

      src = fetchgit {
        url = "https://github.com/bgentry/speakeasy";
        rev = "36e9cfdd690967f4f690c6edcc9ffacd006014a0";
        sha256 = "0grr82p10dk51l082xaqkpq3izj5bhby3l15gj866kngybfb4nzr";
      };
    }
    {
      goPackagePath = "github.com/dgrijalva/jwt-go";

      src = fetchgit {
        url = "https://github.com/dgrijalva/jwt-go";
        rev = "f2193411bd642f7db03249fd79d5292c9b34916a";
        sha256 = "0nkzn8i5f7x3wyi7mhhj9vpdbkdjvrb9hhrw0fqy6vcghia6dhrj";
      };
    }
    {
      goPackagePath = "github.com/digitalocean/godo";

      src = fetchgit {
        url = "https://github.com/digitalocean/godo";
        rev = "6ca5b770f203b82a0fca68d0941736458efa8a4f";
        sha256 = "00di15gdv47jfdr1l8cqphmlv5bzalxk7dk53g3mif7vwhs8749j";
      };
    }
    {
      goPackagePath = "github.com/dylanmei/iso8601";

      src = fetchgit {
        url = "https://github.com/dylanmei/iso8601";
        rev = "2075bf119b58e5576c6ed9f867b8f3d17f2e54d4";
        sha256 = "0px5aq4w96yyjii586h3049xm7rvw5r8w7ph3axhyismrqddqgx1";
      };
    }
    {
      goPackagePath = "github.com/dylanmei/winrmtest";

      src = fetchgit {
        url = "https://github.com/dylanmei/winrmtest";
        rev = "025617847eb2cf9bd1d851bc3b22ed28e6245ce5";
        sha256 = "1i0wq6r1vm3nhnia3ycm5l590gyia7cwh6971ppnn4rrdmvsw2qh";
      };
    }
    {
      goPackagePath = "github.com/go-ini/ini";

      src = fetchgit {
        url = "https://github.com/go-ini/ini";
        rev = "afbd495e5aaea13597b5e14fe514ddeaa4d76fc3";
        sha256 = "0dl5ibrrq2i887i0bf8a9m887rhnpgv6wmwyc1sj8a75c0yd02da";
      };
    }
    {
      goPackagePath = "github.com/google/go-querystring";

      src = fetchgit {
        url = "https://github.com/google/go-querystring";
        rev = "2a60fc2ba6c19de80291203597d752e9ba58e4c0";
        sha256 = "117211606pv0p3p4cblpnirrrassprrvvcq2svwpplsq5vff1rka";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/atlas-go";

      src = fetchgit {
        url = "https://github.com/hashicorp/atlas-go";
        rev = "95fa852edca41c06c4ce526af4bb7dec4eaad434";
        sha256 = "002lpvxi6my8dk4d4ks091ad66bj6rnz4xchbzpqwvp7n8097aqz";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/errwrap";

      src = fetchgit {
        url = "https://github.com/hashicorp/errwrap";
        rev = "7554cd9344cec97297fa6649b055a8c98c2a1e55";
        sha256 = "0kmv0p605di6jc8i1778qzass18m0mv9ks9vxxrfsiwcp4la82jf";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/go-checkpoint";

      src = fetchgit {
        url = "https://github.com/hashicorp/go-checkpoint";
        rev = "e4b2dc34c0f698ee04750bf2035d8b9384233e1b";
        sha256 = "0qjfk1fh5zmn04yzxn98zam8j4ay5mzd5kryazqj01hh7szd0sh5";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/go-cleanhttp";

      src = fetchgit {
        url = "https://github.com/hashicorp/go-cleanhttp";
        rev = "875fb671b3ddc66f8e2f0acc33829c8cb989a38d";
        sha256 = "0ammv6gn9cmh6padaaw76wa6xvg22a9b3sw078v9chcvfk2bggha";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/go-multierror";

      src = fetchgit {
        url = "https://github.com/hashicorp/go-multierror";
        rev = "d30f09973e19c1dfcd120b2d9c4f168e68d6b5d5";
        sha256 = "0dc02mvv11hvanh12nhw8jsislnxf6i4gkh6vcil0x23kj00z3iz";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/go-rootcerts";

      src = fetchgit {
        url = "https://github.com/hashicorp/go-rootcerts";
        rev = "6bb64b370b90e7ef1fa532be9e591a81c3493e00";
        sha256 = "1a81fcm1i0ji2iva0dcimiichgwpbcb7lx0vyaks87zj5wf04qy9";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/go-version";

      src = fetchgit {
        url = "https://github.com/hashicorp/go-version";
        rev = "7e3c02b30806fa5779d3bdfc152ce4c6f40e7b38";
        sha256 = "0ibqaq6z02himzci4krbfhqdi8fw2gzj9a8z375nl3qbzdgzqnm7";
      };
    }
    {
      goPackagePath = "github.com/hashicorp/yamux";

      src = fetchgit {
        url = "https://github.com/hashicorp/yamux";
        rev = "df949784da9ed028ee76df44652e42d37a09d7e4";
        sha256 = "080bmbdaq88ri2pn63mcjc4kq2y2sy1742ypqfgrvwssa1ynvnhy";
      };
    }
    {
      goPackagePath = "github.com/hpcloud/tail";

      src = fetchgit {
        url = "https://github.com/hpcloud/tail";
        rev = "1a0242e795eeefe54261ff308dc685f7d29cc58c";
        sha256 = "0hhr2962xmbqzbf2p79xfrzbmjm33h61fj5zlazj7a55bwxn688d";
      };
    }
    {
      goPackagePath = "github.com/jmespath/go-jmespath";

      src = fetchgit {
        url = "https://github.com/jmespath/go-jmespath";
        rev = "c01cf91b011868172fdcd9f41838e80c9d716264";
        sha256 = "0lp2m33a6x2pjbv5xlbbcr48qri32s84hcgm3xmgvmrx6zyi74zg";
      };
    }
    {
      goPackagePath = "github.com/kardianos/osext";

      src = fetchgit {
        url = "https://github.com/kardianos/osext";
        rev = "29ae4ffbc9a6fe9fb2bc5029050ce6996ea1d3bc";
        sha256 = "1mawalaz84i16njkz6f9fd5jxhcbxkbsjnav3cmqq2dncv2hyv8a";
      };
    }
    {
      goPackagePath = "github.com/klauspost/compress";

      src = fetchgit {
        url = "https://github.com/klauspost/compress";
        rev = "f86d2e6d8a77c6a2c4e42a87ded21c6422f7557e";
        sha256 = "17f9zxrs2k8q5kghppjnbn0xzl3i4fgl4852kj8cg94b51s5ll9f";
      };
    }
    {
      goPackagePath = "github.com/klauspost/cpuid";

      src = fetchgit {
        url = "https://github.com/klauspost/cpuid";
        rev = "349c675778172472f5e8f3a3e0fe187e302e5a10";
        sha256 = "1y7gqpcpcb29ws77328vfm30s8nsrbxyylfpb8ksb8wwg062yv6v";
      };
    }
    {
      goPackagePath = "github.com/klauspost/crc32";

      src = fetchgit {
        url = "https://github.com/klauspost/crc32";
        rev = "999f3125931f6557b991b2f8472172bdfa578d38";
        sha256 = "1sxnq3i7wvcdqx0l91jc04nf5584ym8dxzkz3xvivm8p7kz2xjns";
      };
    }
    {
      goPackagePath = "github.com/klauspost/pgzip";

      src = fetchgit {
        url = "https://github.com/klauspost/pgzip";
        rev = "47f36e165cecae5382ecf1ec28ebf7d4679e307d";
        sha256 = "00jcx3pdwxi4r2l3m4b8jb17b2srckz488cmjvd1vqkr85a0jp2x";
      };
    }
    {
      goPackagePath = "github.com/kr/fs";

      src = fetchgit {
        url = "https://github.com/kr/fs";
        rev = "2788f0dbd16903de03cb8186e5c7d97b69ad387b";
        sha256 = "1c0fipl4rsh0v5liq1ska1dl83v3llab4k6lm8mvrx9c4dyp71ly";
      };
    }
    {
      goPackagePath = "github.com/masterzen/simplexml";

      src = fetchgit {
        url = "https://github.com/masterzen/simplexml";
        rev = "95ba30457eb1121fa27753627c774c7cd4e90083";
        sha256 = "0pwsis1f5n4is0nmn6dnggymj32mldhbvihv8ikn3nglgxclz4kz";
      };
    }
    {
      goPackagePath = "github.com/masterzen/winrm";

      src = fetchgit {
        url = "https://github.com/masterzen/winrm";
        rev = "54ea5d01478cfc2afccec1504bd0dfcd8c260cfa";
        sha256 = "1d4khg7c4vw645id0x301zkgidm4ah6nkmiq52j8wsivi85yhn66";
      };
    }
    {
      goPackagePath = "github.com/masterzen/xmlpath";

      src = fetchgit {
        url = "https://github.com/masterzen/xmlpath";
        rev = "13f4951698adc0fa9c1dda3e275d489a24201161";
        sha256 = "1y81h7ymk3dp3w3a2iy6qd1dkm323rkxa27dzxw8vwy888j5z8bk";
      };
    }
    {
      goPackagePath = "github.com/mattn/go-isatty";

      src = fetchgit {
        url = "https://github.com/mattn/go-isatty";
        rev = "56b76bdf51f7708750eac80fa38b952bb9f32639";
        sha256 = "0l8lcp8gcqgy0g1cd89r8vk96nami6sp9cnkx60ms1dn6cqwf5n3";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/cli";

      src = fetchgit {
        url = "https://github.com/mitchellh/cli";
        rev = "5c87c51cedf76a1737bf5ca3979e8644871598a6";
        sha256 = "1ajxzh3winjnmqhd4yn6b6f155vfzi0dszhzl4a00zb5pdppp1rd";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/go-fs";

      src = fetchgit {
        url = "https://github.com/mitchellh/go-fs";
        rev = "a34c1b9334e86165685a9449b782f20465eb8c69";
        sha256 = "11sy85p77ffmavpiichzybrfvjm1ilsi4clx98n3363arksavs5i";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/go-homedir";

      src = fetchgit {
        url = "https://github.com/mitchellh/go-homedir";
        rev = "d682a8f0cf139663a984ff12528da460ca963de9";
        sha256 = "0vsiby9fbkaz7q067wmc6s5pzgpq4gdfx66cj2a1lbdarf7j1kbs";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/go-vnc";

      src = fetchgit {
        url = "https://github.com/mitchellh/go-vnc";
        rev = "723ed9867aed0f3209a81151e52ddc61681f0b01";
        sha256 = "0nlya2rbmwb3jycqsyah1pn4386712mfrfiprprkbzcna9q7lp1h";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/iochan";

      src = fetchgit {
        url = "https://github.com/mitchellh/iochan";
        rev = "87b45ffd0e9581375c491fef3d32130bb15c5bd7";
        sha256 = "1435kdcx3j1xgr6mm5c7w7hjx015jb20yfqlkp93q143hspf02fx";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/mapstructure";

      src = fetchgit {
        url = "https://github.com/mitchellh/mapstructure";
        rev = "281073eb9eb092240d33ef253c404f1cca550309";
        sha256 = "1zjx9fv29639sp1fn84rxs830z7gp7bs38yd5y1hl5adb8s5x1mh";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/multistep";

      src = fetchgit {
        url = "https://github.com/mitchellh/multistep";
        rev = "162146fc57112954184d90266f4733e900ed05a5";
        sha256 = "0ydhbxziy9204qr43pjdh88y2jg34g2mhzdapjyfpf8a1rin6dn3";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/panicwrap";

      src = fetchgit {
        url = "https://github.com/mitchellh/panicwrap";
        rev = "a1e50bc201f387747a45ffff020f1af2d8759e88";
        sha256 = "0w5y21psgrl1afsap613c3qw84ik7zhnalnv3bf6r51hyv187y69";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/prefixedio";

      src = fetchgit {
        url = "https://github.com/mitchellh/prefixedio";
        rev = "6e6954073784f7ee67b28f2d22749d6479151ed7";
        sha256 = "0an2pnnda33ns94v7x0sv9kmsnk62r8xm0cj4d69f2p63r85fdp6";
      };
    }
    {
      goPackagePath = "github.com/mitchellh/reflectwalk";

      src = fetchgit {
        url = "https://github.com/mitchellh/reflectwalk";
        rev = "eecf4c70c626c7cfbb95c90195bc34d386c74ac6";
        sha256 = "1nm2ig7gwlmf04w7dbqd8d7p64z2030fnnfbgnd56nmd7dz8gpxq";
      };
    }
    {
      goPackagePath = "github.com/nu7hatch/gouuid";

      src = fetchgit {
        url = "https://github.com/nu7hatch/gouuid";
        rev = "179d4d0c4d8d407a32af483c2354df1d2c91e6c3";
        sha256 = "175alsrjb2a1qzwp1l323vwwpirzaj95yfqqfi780698myhpb52k";
      };
    }
    {
      goPackagePath = "github.com/packer-community/winrmcp";

      src = fetchgit {
        url = "https://github.com/packer-community/winrmcp";
        rev = "f1bcf36a69fa2945e65dd099eee11b560fbd3346";
        sha256 = "0pj5gfbmx507lp1w3gfn23x0rn0x5rih9nqij9g8d9c4m1sx3275";
      };
    }
    {
      goPackagePath = "github.com/pierrec/lz4";

      src = fetchgit {
        url = "https://github.com/pierrec/lz4";
        rev = "383c0d87b5dd7c090d3cddefe6ff0c2ffbb88470";
        sha256 = "0l23bmzqfvgh61zlikj6iakg0kz7lybs8zf0nscylskl2hlr09rp";
      };
    }
    {
      goPackagePath = "github.com/pierrec/xxHash";

      src = fetchgit {
        url = "https://github.com/pierrec/xxHash";
        rev = "5a004441f897722c627870a981d02b29924215fa";
        sha256 = "146ibrgvgh61jhbbv9wks0mabkci3s0m68sg6shmlv1yixkw6gja";
      };
    }
    {
      goPackagePath = "github.com/pkg/sftp";

      src = fetchgit {
        url = "https://github.com/pkg/sftp";
        rev = "e84cc8c755ca39b7b64f510fe1fffc1b51f210a5";
        sha256 = "0v6g9j9pnkqz72x5409y8gd8ycniziydvsjb4298dkd21d3b94dg";
      };
    }
    {
      goPackagePath = "github.com/rackspace/gophercloud";

      src = fetchgit {
        url = "https://github.com/rackspace/gophercloud";
        rev = "53d1dc4400e1ebcd37a0e01d8c1fe2f4db3b99d2";
        sha256 = "0rdyljj395k1w7xnxw1i76w29fgl517mvs7bsqll35lss2gbhan2";
      };
    }
    {
      goPackagePath = "github.com/satori/go.uuid";

      src = fetchgit {
        url = "https://github.com/satori/go.uuid";
        rev = "d41af8bb6a7704f00bc3b7cba9355ae6a5a80048";
        sha256 = "0lw8k39s7hab737rn4nngpbsganrniiv7px6g41l6f6vci1skyn2";
      };
    }
    {
      goPackagePath = "github.com/tent/http-link-go";

      src = fetchgit {
        url = "https://github.com/tent/http-link-go";
        rev = "ac974c61c2f990f4115b119354b5e0b47550e888";
        sha256 = "0iwq842pvp5y77cr25yanj1cgqzmkz1aw6jzgjrrmlqqkdad5z8c";
      };
    }
    {
      goPackagePath = "github.com/ugorji/go";

      src = fetchgit {
        url = "https://github.com/ugorji/go";
        rev = "646ae4a518c1c3be0739df898118d9bccf993858";
        sha256 = "0njncpdbh115l5mxyks08jh91kdmy0mvbmxj9mr1psv5k97gf0pn";
      };
    }
    {
      goPackagePath = "golang.org/x/crypto";

      src = fetchgit {
        url = "https://go.googlesource.com/crypto";
        rev = "1f22c0103821b9390939b6776727195525381532";
        sha256 = "05ahvn9g9cj7797n8ryfxv2g26v3lx1pza9d9pg97iw0rvar9i1h";
      };
    }
    {
      goPackagePath = "golang.org/x/net";

      src = fetchgit {
        url = "https://go.googlesource.com/net";
        rev = "6ccd6698c634f5d835c40c1c31848729e0cecda1";
        sha256 = "05c7kdjkvf7hrdiv1k12nyss6s8chhakqn1adxbrrahr6rl1nhpj";
      };
    }
    {
      goPackagePath = "golang.org/x/oauth2";

      src = fetchgit {
        url = "https://go.googlesource.com/oauth2";
        rev = "8a57ed94ffd43444c0879fe75701732a38afc985";
        sha256 = "10pxnbsy1lnx7a1x6g3cna5gdm11aal1r446dpmpgj94xiw96mxv";
      };
    }
    {
      goPackagePath = "google.golang.org/api";

      src = fetchgit {
        url = "https://code.googlesource.com/google-api-go-client";
        rev = "ddff2aff599105a55549cf173852507dfa094b7f";
        sha256 = "03058zh0v997fxmlvd8r4m63r3z0fzg6fval6wnxw3wq22m7h3yx";
      };
    }
    {
      goPackagePath = "google.golang.org/cloud";

      src = fetchgit {
        url = "https://code.googlesource.com/gocloud";
        rev = "5a3b06f8b5da3b7c3a93da43163b872c86c509ef";
        sha256 = "03zrw3mgh82gvfgz17k97n8hivnvvplc42c7vyr76i90n1mv29g7";
      };
    }
    {
      goPackagePath = "gopkg.in/fsnotify.v1";

      src = fetchgit {
        url = "https://gopkg.in/fsnotify.v1";
        rev = "8611c35ab31c1c28aa903d33cf8b6e44a399b09e";
        sha256 = "17a7z88860hhmbgmpc2si1n67s8zk3vzwv5r4wyhrsljcq0bcv9q";
      };
    }
    {
      goPackagePath = "gopkg.in/tomb.v1";

      src = fetchgit {
        url = "https://gopkg.in/tomb.v1";
        rev = "dd632973f1e7218eb1089048e0798ec9ae7dceb8";
        sha256 = "1lqmq1ag7s4b3gc3ddvr792c5xb5k6sfn0cchr3i2s7f1c231zjv";
      };
    }
    {
      goPackagePath = "gopkg.in/xmlpath.v2";

      src = fetchgit {
        url = "https://gopkg.in/xmlpath.v2";
        rev = "860cbeca3ebcc600db0b213c0e83ad6ce91f5739";
        sha256 = "0jgvd0y78fir4vkcj8acs0pdvlc0xr7i7cspbkm2yjm8wv23p63h";
      };
    }
  ];
}
