{
  pkgs,
  ...
}: pkgs.buildGoModule {
  pname = "cliamp";
  name = "cliamp";

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    alsa-lib
    flac
    libvorbis
    oggvideotools 
  ];

  src = fetchGit {
    url = "https://github.com/bjarneo/cliamp.git";
  };

  vendorHash = "sha256-UMDCpfSGfvJmI+sImaFzgZpLNaLMgEnmGCqERwPokHM=";
}
