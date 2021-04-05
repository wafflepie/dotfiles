SCRIPT_PATH=$(readlink -f $0)
SCRIPT_DIR=`dirname $SCRIPT_PATH`

cd "$SCRIPT_DIR/../../submodules/xmm7360-pci"

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
