{
  security = {
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };
    audit.enable = true;
    audit.rules = [
      "-w /bin/wish -p x -k susp_shell"
      "-w /usr/bin/wish -p x -k susp_shell"
      "-w /bin/yash -p x -k susp_shell"
      "-w /usr/bin/yash -p x -k susp_shell"
      "-a always,exit -F arch=b64 -S kexec_load -k KEXEC"
      "-a always,exit -F arch=b64 -F uid!=ntp -S adjtimex -S settimeofday -S clock_settime -k time"
      "-a always,exit -F perm=x -F auid!=-1 -F path=/sbin/insmod -k modules"
      "-a always,exit -F perm=x -F auid!=-1 -F path=/sbin/modprobe -k modules"
      "-a always,exit -F perm=x -F auid!=-1 -F path=/sbin/rmmod -k modules"
      "-a always,exit -F arch=b64 -S finit_module -S init_module -S delete_module -F auid!=-1 -k modules"
      "-a never,exit -F arch=b64 -S adjtimex -F auid=-1 -F uid=chrony -F subj_type=chronyd_t"
      "-a always,exclude -F msgtype=CRYPTO_KEY_USER"
      "-a never,exit -F arch=b64 -F dir=/dev/shm -k sharedmemaccess"
      "-a always,exit -F arch=b64 -S ptrace -F a0=0x4 -k code_injection"
      "-a always,exit -F arch=b64 -S ptrace -F a0=0x5 -k data_injection"
      "-a always,exit -F arch=b64 -S ptrace -F a0=0x6 -k register_injection"
      "-a always,exit -F arch=b64 -S ptrace -F a0=0x6 -k register_injection"
    ];

  };
  services.sshguard = {
    enable = true;
    services = [
      "sshd"
    ];
    whitelist = [
      "127.0.0.1"
      "192.168.1.1"
    ];
    attack_threshold = 30;
  };
}
