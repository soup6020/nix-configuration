{ pkgs, ...}:
#Set up a basic postfix local mail transfer agent
{
  services.postfix = {
    package = pkgs.postfix;
    enable = true;
    enableSmtp = false; #Not necessary for internal mail
    setSendmail = true; #Set system sendmail to postfix
    enableSubmission = false; #Plaintext/StartTLS submission, do not use
    enableSubmissions = false; #TLS submission, preferred but not necessary for local mail

    settings.main = {
      myhostname = "wendigo.local";
      mynetworks = [
        "127.0.0.0/8"
        "::1"
      ];
      mydestination = [
        "wendigo.local"
        "wendigo"
        "localhost.local"
        "localhost"
      ];
    };
  };
}
