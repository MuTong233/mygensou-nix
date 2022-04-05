# Network Configuration
{ ... }:

{
  # Wireless Network configuration
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set hostname and domain if necessary
  networking.hostName = "MyGensouNix";
  # networking.domain = "mygensou.cn";

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = true;
  networking.interfaces.ens33.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Open a range of ports in the firewall.
  # networking.firewall.allowedUDPPortRanges = [{ from = 1714; to = 1764; }];
  # networking.firewall.allowedTCPPortRanges = [{ from = 1714; to = 1764; }];

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Allow Ping
  # networking.firewall.allowPing = false;
  # networking.firewall.rejectPackets = true;
}