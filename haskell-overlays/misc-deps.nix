{ hackGet }:

# Fix misc upstream packages
self: super:

let
  pkgs = self.callPackage ({ pkgs }: pkgs) {};
  haskellLib = pkgs.haskell.lib;
in

{
  hnix = haskellLib.dontCheck (haskellLib.doJailbreak (self.callCabal2nix "hnix" (hackGet ../dep/hnix) {}));
  hnix-store-core = haskellLib.dontCheck (self.callHackage "hnix-store-core" "0.1.0.0" {});
  regex-tdfa-text = haskellLib.dontCheck (self.callHackage "regex-tdfa-text" "1.0" {});

  ghcid = self.callCabal2nix "ghcid" (hackGet ../dep/ghcid) {};
  # Exports more internals
  snap-core = haskellLib.dontCheck (self.callCabal2nix "snap-core" (hackGet ../dep/snap-core) {});

  shelly = self.callHackage "shelly" "1.9.0" {};

  aeson = self.callHackage "aeson" "1.4.4.0" {};
  cases = haskellLib.dontCheck (self.callHackage "cases" "0.1.3.2" {});
  colour = haskellLib.dontCheck (self.callHackage "colour" "2.3.5" {});
  ansi-terminal = self.callHackage "ansi-terminal" "0.9.1" {};
  test-framework = haskellLib.dontCheck (self.callHackage "test-framework" "0.8.2.0" {});
  functor-infix = self.callHackage "functor-infix" "0.0.5" {};
  quickcheck-instances = self.callHackage "quickcheck-instances" "0.3.22" {};
  hashable = self.callHackage "hashable" "1.2.7.0" {};
  scientific = self.callHackage "scientific" "0.3.6.2" {};
  attoparsec = self.callHackage "attoparsec" "0.13.2.2" {};
  async = self.callHackage "async" "2.2.2" {};
  logict = self.callHackage "logict" "0.7.0.2" {};
  smallcheck = self.callHackage "smallcheck" "1.1.5" {};
  tasty = self.callHackage "tasty" "1.2.3" {};
  hspec-core = haskellLib.dontCheck (self.callHackage "hspec-core" "2.7.1" {});
  hspec-discover = self.callHackage "hspec-discover" "2.7.1" {};
  hspec = self.callHackage "hspec" "2.7.1" {};
  base-orhpans = self.callHackage "base-orhpans" "0.8.1" {};
  time-compat = self.callHackage "time-compat" "1.9.2.2" {};
  these = self.callHackage "these" "1.0.1" {};
  vector = haskellLib.dontCheck (self.callHackage "vector" "0.12.0.3" {});
  random = self.callHackage "random" "1.1" {};
  git = self.callHackage "git" "0.2.2" {};
  logging-effect = self.callHackage "logging-effect" "1.3.4" {};
}
