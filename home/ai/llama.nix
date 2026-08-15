{ pkgs, ... }: {
  home.packages = with pkgs; [
    (llama-cpp.override {
      cudaSupport = true;
      blasSupport = true;
    })
    llama-swap
  ];
}
