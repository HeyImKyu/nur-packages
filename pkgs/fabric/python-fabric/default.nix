{
  lib,
  python312Packages,
  gtk3,
  gtk-layer-shell,
  cairo,
  gobject-introspection,
  libdbusmenu-gtk3,
  gdk-pixbuf,
  cinnamon-desktop,
  gnome-bluetooth,
  fetchFromGitHub,
  ...
}:

python312Packages.buildPythonPackage {
  pname = "python-fabric";
  version = "0.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Fabric-Development";
    repo = "fabric";
    rev = "41eb2289184479026eb7138cdd539fdffcca03c1";
    hash = "sha256-+Hg9ZA0otWlg4P40UeI+slcK732BmYtnM8amxsCh6EY=";
  };

  buildInputs = [
    gtk3
    gtk-layer-shell
    cairo
    gobject-introspection
    libdbusmenu-gtk3
    gdk-pixbuf
    cinnamon-desktop
    gnome-bluetooth
  ];

  dependencies = with python312Packages; [
    setuptools
    click
    pycairo
    pygobject3
    pygobject-stubs
    loguru
    psutil
  ];

  meta = with lib; {
    description = "next-gen framework for building desktop widgets using Python";
    homepage = "https://github.com/Fabric-Development/fabric";
    license = licenses.agpl3Plus;
    maintainers = [
      {
        email = "heyimkyu@mailbox.org";
        github = "HeyImKyu";
        githubId = 43815343;
        name = "Kyu";
      }
    ];
  };
}
