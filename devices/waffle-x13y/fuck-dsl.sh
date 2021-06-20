SCRIPT_PATH=$(readlink -f $0)
SCRIPT_DIR=`dirname $SCRIPT_PATH`

cd "$SCRIPT_DIR/../../submodules/xmm7360-pci"

git clean -dfx
git restore .

# https://github.com/xmm7360/xmm7360-pci/issues/96
sed -i '1332d' xmm7360.c

if [[ ! -f xmm7360.ini ]]; then
  cp xmm7360.ini.sample xmm7360.ini
  sed -i 's/your.apn.here/internet.t-mobile.cz/' xmm7360.ini
fi

sudo ./scripts/lte.sh setup
sudo lte up

sudo resolvectl dns wwan0 8.8.8.8

TARGET_PATH=~/.local/bin/fuck-dsl

if [[ ! -f "$TARGET_PATH" ]]; then
  ln -s "$SCRIPT_PATH" "$TARGET_PATH"
fi
