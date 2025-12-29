{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ocaml
    dune_3
    ocamlPackages.findlib
    ocamlPackages.ocaml-lsp
    ocamlPackages.ocamlformat
    ocamlPackages.utop
  ];
}
