#!/usr/bin/env python3

shift = 4*1024

ccp_addr = 0xCC00
bdos_addr = 0xD406
bios_addr = 0xE200

assert(bdos_addr == (ccp_addr + 0x806))
assert(bios_addr == (ccp_addr + 0x1600))

out_ccp_addr = ccp_addr + shift
out_bdos_addr = bdos_addr + shift
out_bios_addr = bios_addr + shift

assert(out_bdos_addr == (out_ccp_addr + 0x806))
assert(out_bios_addr == (out_ccp_addr + 0x1600))

print(f"CCP address: {hex(out_ccp_addr)}")
print(f"BDOS address: {hex(out_bdos_addr)}")
print(f"BIOS address: {hex(out_bios_addr)}")
