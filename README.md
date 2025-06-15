# eBPF-drop-rfc-3514
This eBPF module will drop any IPv4 packets that have the RFC 3514 "evil bit" set.
```
$ make
$ sudo bpftool prog load xdp_ebpf_prog.o /sys/fs/bpf/xdp_evilbit type xdp
$ sudo bpftool net attach xdp pinned /sys/fs/bpf/xdp_evilbit dev enp0s1
```
