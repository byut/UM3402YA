# Asus Zenbook (UM3402YA) on Linux

The following briefly outlines the solutions to the most commonly encountered
issues with the UM3402YA model on Linux systems (based on what worked for me)

### Sound

> In the default kernel configuration, there is currently no sound output with
> the internal speakers, due to the Cirrus CS35L41 HD amplifier which cannot be
> set up properly on boot \[1\]. The ASUS Zenbook UM3402YA series seems to not
> be the only device where this problem occurs
>
> [Arch Wiki](https://wiki.archlinux.org/title/ASUS_Zenbook_UM3402YA)

There are many suggestions online for fixing this problem. After spending hours
searching, none of them worked except for
[this](https://github.com/farfaaa/asus_zenbook_UM3402YA) one. Surprisingly, it
was the easiest solution I found, and the only one that actually fixed the issue
for me (and hopefully for you too). I've added the files from that repository
here for convenience. If you're running Arch, you can apply the fix quickly by
running the small script I wrote.

```bash
./sound/archfix.sh
```

Otherwise, please refer to the instructions provided in the original repository.
