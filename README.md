# manjaro2archlinux
 Convert your manjaro to archlinux

```sh
curl -s https://raw.githubusercontent.com/saeziae/manjaro2archlinux/main/manjaro2arch.sh | sudo bash
```

This script originally use software source mirror provided by Tsinghua Univerisity, which works well in China.
If you want to use another mirror, use commands below. Choose from <https://archlinux.org/mirrorlist/all/>

```sh
myMirror=https://mirrors.kernel.org/archlinux/\$repo/os/\$arch #your mirror address, remind to add \ before $
curl -s https://raw.githubusercontent.com/saeziae/manjaro2archlinux/main/manjaro2arch.sh | sed -r "s/Server.*'/Server = $myMirror '/g" | sudo bash
```
