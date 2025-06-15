BPF_SRC := xdp_ebpf_prog.c
BPF_OBJ := xdp_ebpf_prog.o

ARCH := $(shell uname -m)
BTF := /sys/kernel/btf/vmlinux

CLANG := clang
#CFLAGS := -O2 -g -Wall -Werror -target bpf -D__TARGET_ARCH_$(ARCH)
CFLAGS := -O2 -g -Wall -Werror -target bpf

#ifeq ($(wildcard $(BTF)), $(BTF))
#    CFLAGS += -g
#else
#    $(warning "BTF file not found, CO-RE may not work properly.")
#endif

all: $(BPF_OBJ)

$(BPF_OBJ): $(BPF_SRC)
	$(CLANG) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(BPF_OBJ)
