{ lib, stdenv, rustPlatform, fetchCrate, pkg-config, libusb1
, libiconv }:

rustPlatform.buildRustPackage rec {
  pname = "probe-run";
  version = "0.2.5";

  src = fetchCrate {
    inherit pname version;
    sha256 = "0fbybl3yzjzdzhppj5wfn2h2f0h92v6l5zfxyl5cdd5zrddyn19f";
  };

  cargoSha256 = "1kqgl1f91aa7kz1yprpyf9pl1vp4ahhw8ka5hrvfvk5i5i54pigz";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libusb1 ] ;

  meta = with lib; {
    description = "Run embedded programs just like native ones.";
    homepage = "https://github.com/knurling-rs/probe-run";
    changelog = "https://github.com/knurling-rs/probe-run/blob/v${version}/CHANGELOG.md";
    license = with licenses; [ asl20 /* or */ mit ];
    maintainers = with maintainers; [ hoverbear ];
  };
}
