argumant=$1
packageName=$2
unknownArgument=$3

if [ "$unknownArgument" ]; then
  echo "stix: unknown argument '$unknownArgument'. Try 'stix help' for more information."
  exit 1
fi

if [ -z "$1" ] || [ "$argumant" = "help" ] || [ "$argumant" = "h" ]; then
  echo "Usage: stix [argument] [package name]"
  echo "Arguments:"
  echo "  [init]: cloning the xbps-src repository"
  echo "  [pull] or [p]: syncing the repository"
  echo "  [search] or [s]: displaying the available packages"
  echo "  [install] or [i]: installing the packge"
  exit 1

elif [ "$argumant" = "search" ] || [ "$argumant" = "s" ]; then
  ls ~/.packages/void-packages/srcpkgs/ | grep "$packageName"
  exit 1

elif [ "$argumant" = "init" ]; then
  sudo xbps-install xtools git
  mkdir ~/.packages
  git clone https://github.com/void-linux/void-packages ~/.packages/void-packages
  ~/.packages/void-packages/xbps-src binary-bootstrap
  echo XBPS_ALLOW_RESTRICTED=yes >>  ~/.packages/void-packages/etc/conf
  exit 1

elif [ "$argumant" = "install" ] || [ "$argumant" = "i" ]; then
  cd ~/.packages/void-packages
  git pull
  ./xbps-src pkg "$packageName"
  xi "$packageName"
  exit 1

elif [ "$argumant" = "pull" ] || [ "$argumant" = "p" ]; then
  cd ~/.packages/void-packages
  git pull
  exit 1

else
  echo "stix: unknown argument '$argumant'. Try 'stix help' for more information."
  exit 1
fi
