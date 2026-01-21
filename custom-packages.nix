{ inputs, pkgs, ... }:

let
  custom-pkgs-dir = "custom-packages";

  naersk' = pkgs.callPackage inputs.naersk;
in
{
  environment.systemPackages = [

    # edu-sync
    (naersk'.buildPackage {
      src = ./. + "/${custom-pkgs-dir}/edu-sync";
    })

  ];
}
