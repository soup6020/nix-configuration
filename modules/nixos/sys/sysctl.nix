{
  boot.kernel.sysctl = {
    #Networking
    "net.core.default_qdisc" = "cake";
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.ip_forward" = 1;
    "net.ipv4.conf.all.proxy_arp" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
    "net.core.rmem_default" = 31457280;
    "net.core.rmem_max" = 33554432;
    "net.core.wmem_default" = 31457280;
    "net.core.somaxconn" = 65535;
    "net.core.netdev_max_backlog" = 65536;
    "net.core.optmem_max" = 25165824;
    "net.ipv4.tcp_rmem" = "8192 87380 33554432";
    "net.ipv4.udp_rmem_min" = 16384;
    "net.ipv4.tcp_wmem" = "8192 65536 33554432";
    "net.ipv4.udp_wmem_min" = 16384;
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_max_syn_backlog" = 8192;

    #Security
    "kernel.kptr_restrict" = 2;
    "kernel.sysrq" = 0;
    "kernel.dmesg_restrict" = 1;
    "net.core.bpf_jit_harden" = 2;
    "kernel.randomize_va_space" = 2;
    "kernel.unprivileged_bpf_disabled" = 1;
    "vm.unprivileged_userfaultfd" = 0;
    "kernel.io_uring_disabled" = 2;
    "fs.protected_fifos" = 2;
    "fs.protected_regular" = 2;
    "fs.suid_dumpable" = 0;
    "fs.protected_hardlinks" = 1;
    #"fs.protected_symlinks" = 1;
    "dev.tty.legacy_tiocsti" = 0;

    #Kinda insecure but breaks OCI containers and bwrap if not enabled
    "kernel.unprivileged_userns_clone" = 1;

    #Memory hardening
    #"vm.max_map_count" = 262144;
    "vm.max_map_count" = 1048576;
    "vm.mmap_rnd_bits" = 32;
    "vm.mmap_rnd_compat_bits" = 16;

    #Network stack hardening
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.all.shared_media" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.conf.default.shared_media" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_timestamps" = 0;
  };
}
