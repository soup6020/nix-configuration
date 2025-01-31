{
  #Enable sftp explicitly.
  services.openssh.allowSFTP = true;

  # Do not allow forwarding X11 (graphical) applications.
  services.openssh.settings.X11Forwarding = false;

  # Do not allow keyboard-interactive based authentication.
  services.openssh.settings.KbdInteractiveAuthentication = false;

  # Do not allow password based authentication.
  services.openssh.settings.PasswordAuthentication = false;

  # Do not allow logins against root user.
  services.openssh.settings.PermitRootLogin = "no";

  #Explicitly disable gateway ports.
  services.openssh.settings.GatewayPorts = "no";

  # Mozilla's Modern OpenSSH 6.7+ configuration, modified by me (soup6020)
  # Source: https://infosec.mozilla.org/guidelines/openssh
  services.openssh.settings.KexAlgorithms = [
    "sntrup761x25519-sha512@openssh.com"
    "curve25519-sha256@libssh.org"
    "diffie-hellman-group18-sha512"
    "diffie-hellman-group16-sha512"
  ];
  services.openssh.settings.Ciphers = [
    "chacha20-poly1305@openssh.com"
    "aes256-gcm@openssh.com"
    "aes128-gcm@openssh.com"
    "aes256-ctr"
    "aes192-ctr"
    "aes128-ctr"
  ];
  services.openssh.settings.Macs = [
    "hmac-sha2-512-etm@openssh.com"
    "hmac-sha2-256-etm@openssh.com"
    "umac-128-etm@openssh.com"
  ];
}
