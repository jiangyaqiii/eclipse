echo "\$nrconf{kernelhints} = 0;" >> /etc/needrestart/needrestart.conf
echo "\$nrconf{restart} = 'l';" >> /etc/needrestart/needrestart.conf
sudo apt update -y

echo "安装rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"
rustc --version
echo "rust已安装"

echo "安装solana cli"
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
solana --version
echo "solana cli已安装"

echo "安装依赖"
sudo apt-get install nodejs -y
sudo apt-get install npm -y
npm install --global yarn -y
node -v
npm --version
yarn --version
echo "依赖已安装"

echo "安装anchor"
cargo install --git https://github.com/project-serum/anchor anchor-cli --locked
anchor --version
echo "anchhor已安装"

echo "创建solana钱包"
solana-keygen new --no-passphrase -o /path-to-wallet/my-wallet.json
echo "钱包已创建，保存钱包信息"

echo "更新钱包配置"
solana config set --url https://testnet.dev2.eclipsenetwork.xyz/
solana config set --keypair /path-to-wallet/my-wallet.json
solana address
echo "钱包配置已更新"
