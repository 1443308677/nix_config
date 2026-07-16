{ pkgs, ... }: {
    home.packages = with pkgs; [
        rustup           # Rust 工具链管理器（装好后 rustup install stable）
    ];
}
