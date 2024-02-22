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

### Combo Audio Jack

The UM3402YA model is very compact, so instead of having separate ports for
headphones and microphones, there's only one combined port available for both.
However, when I tried to use the microphone from my headset, it wasn't
recognized by the system, even though the headset itself worked fine. Despite
pavucontrol showing a separate input device slot for the headset's microphone,
the system didn't seem to pick up any sound from it.

To resolve this, we just have to ensure that our audio jack supports both
headphones and microphones, and then retask it accordingly. To achieve that, we
can use the hdajackretask utility (included in the alsa-tools package on Arch
Linux). Once installed, follow the steps below:

1. Launch the utility from a terminal with root privileges using the following
   command:

```sh
sudo -E hdajackretask
```

2. Once the utility opens, locate the "Options" section in the upper-left corner
   of the window
3. Tick the checkbox marked "Show unconnected pins"
4. Locate the unconnected pin with the ID 0x19
5. Select 'Microphone' instead of the option 'Not connected'
6. Click the 'Apply now' button
7. Verify if the changes have had the desired effect.
