{ mkDerivation, base, containers, directory, lib
, optparse-applicative, process, text
}:
mkDerivation {
  pname = "hasktagging";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base containers directory optparse-applicative process text
  ];
  license = lib.licenses.bsd3;
}
