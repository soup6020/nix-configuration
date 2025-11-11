{ pkgs, ...}:
{

  time.timeZone = "America/Vancouver";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
    useXkbConfig = true; # use xkb.options in tty.
    earlySetup = true; # work around a systemd-vconsole-setup bug in stage1 init
  };
}
