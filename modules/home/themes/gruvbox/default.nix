{ 
stdenv
, fetchFromGithub
, lib
, gtk-engine-murrine
}:
stdenv.makeDerivation {
  pname = "gruvbox-gtk";
  version = "2024-03-11";

  src = fetchFromGithub {
    url = "https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme";
    sha256 = lib.fakeSha256;
  };
  
  propagatedUserEnvPkgs = [ gtk-engine-murrine ];
  
  meta = with lib; {
    description = "Gruvbox theme for GTK 2/3";
    homepage = "https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = [ maintainers.vanilla ];
  };
}
