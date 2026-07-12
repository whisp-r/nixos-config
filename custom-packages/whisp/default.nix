{
  lib,
  fetchFromGitHub,
  nix-update-script,
  meson,
  ninja,

  desktop-file-utils,
  appstream,

  python3,
  python3Packages,

  wrapGAppsHook4,
  gobject-introspection,

  libadwaita,
  glib,
  gtk4,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "whisp";
  version = "1.3.7";
  pyproject = false; # uses meson

  src = fetchFromGitHub {
    owner = "tanaybhomia";
    repo = "Whisp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-FcKRgC78XMKUN02hZ8KCAGrhDWoFj4AlTL7GiRdwAhU=";
  };

  nativeBuildInputs = [
    meson
    ninja
    appstream
    desktop-file-utils
    python3
    gobject-introspection
    wrapGAppsHook4
    glib # For `glib-compile-schemas`
    gtk4 # For `gtk-update-icon-cache`
  ];

  buildInputs = [
    libadwaita
  ];

  dependencies = [
    python3Packages.pygobject3
  ];

  strictDeps = true;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "The Anti-Note for GNOME. A fluid, gesture-driven scratchpad designed for absolute speed";
    homepage = "https://github.com/tanaybhomia/Whisp";
    changelog = "https://github.com/tanaybhomia/Whisp/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ whiisper ];
    mainProgram = "whisp";
    platforms = lib.platforms.linux;
  };
})
