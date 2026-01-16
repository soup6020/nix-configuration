let
  ezra = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdF+kZ34Jgu/mVAh7lBjK01lJ6LUxFdQ9VJuQ8d7psh";
  ezra2 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOaotCRBxQmuHg2kj/xnyb60iiKxwwNnWObMZt4jpZYG";
  users = [
    ezra
    ezra2
  ];

  wendigo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINe/ci+J1Nc2fLt/VeCRRbHqv1lZISwJYDv8kmyYbrJX";
  mbp = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO37F/ew1oGNwdYfH0KUQiHYEdEVXbCRdVuv9Z2uEpfg";
  systems = [
    wendigo
    mbp
  ];
in
{
  #"mpdscribble.age".publicKeys = [ ezra wendigo ];
  "ezra.age".publicKeys = [
    ezra
    wendigo
  ];
  "mpdscribble.age".publicKeys = users ++ systems;
  "awg-privatekey.age".publicKeys = [
    ezra
    wendigo
  ];
  "awg-psk.age".publicKeys = users ++ systems;
}
