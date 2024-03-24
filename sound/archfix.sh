#!/bin/sh

[ "$EUID" -ne 0 ]                                                   \
    && echo -ne "[archfix]: This script must be run by root!\n" >&2 \
    && exit 1

[ ! -f "/etc/arch-release" ]                                              \
    && echo -ne "[archfix]: This script must be run on Arch Linux!\n" >&2 \
    && exit 1

! command -v "iasl" &> /dev/null                        \
    && echo -ne "[archfix]: Command not found (iasl). " \
    && echo -ne "Try 'pacman -S acpica'\n"              \
    && exit 1

iasl -tc sound/ssdt_csc3551.dsl
cp -f sound/ssdt_csc3551.aml /boot
cp -f sound/01_acpi /etc/grub.d
chmod +x /etc/grub.d/01_acpi
grub-mkconfig -o /boot/grub/grub.cfg

exit 0
