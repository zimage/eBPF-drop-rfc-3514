# 🧅 eBPF-drop-rfc-3514: Finally, Security Done Right™**

In a world full of overcomplicated intrusion detection systems, deep packet inspection, machine learning firewalls, and "zero trust" buzzwords, one critical solution has been overlooked — until now.

**This XDP program brings you real security** by enforcing the long-neglected [RFC 3514](https://datatracker.ietf.org/doc/html/rfc3514):

> “The Security Flag in the IPv4 Header”, also known as the evil bit.

## 🎯 What It Does

This eBPF/XDP program inspects incoming IPv4 packets at the earliest possible point in the Linux networking stack — and **drops any packet that dares to admit it's evil** (i.e., has the evil bit set in the IP header's fragment offset field).

As per the RFC, we assume all non-evil packets are trustworthy, and all evil ones… well, we drop them with prejudice. We also increment a handy counter so you can keep track of how well your network is being protected.

## 🤔 Why Hasn’t Anyone Done This Before?
We don’t know.
The evil bit has been part of the IPv4 specification since **April 1st, 2003**, and **everyone always follows RFCs**, especially the security-related ones.

It's frankly shocking that this bulletproof strategy hasn't seen widespread adoption in enterprise firewalls, mobile devices, or quantum satellite mesh networks. But don't worry — we're here to fix that.

## 🛡️ Key Features
* ✅ Drops packets with the evil bit set
* 📊 Tracks the number of evil packets dropped
* ⚡ Runs entirely in XDP (eXpress Data Path) for blazing performance
* 💯 Standards-compliant

## 🚀 How to Use

Compile it. Attach it. Sleep better at night.

```bash
make
sudo ip link set dev eth0 xdp obj xdp_evilbit.o sec xdp
```
or
```bash 
make
sudo bpftool prog load xdp_ebpf_prog.o /sys/fs/bpf/xdp_evilbit type xdp
sudo bpftool net attach xdp pinned /sys/fs/bpf/xdp_evilbit dev enp0s1
```
