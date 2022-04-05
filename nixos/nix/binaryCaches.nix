{ ... }:
{
  # sudo nixos-rebuild switch --option substituters https://cache.nixos.org/
  nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
}
