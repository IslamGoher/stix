if [ -z "$1" ]; then
  echo "No argument provided. Please provide an argument."
  echo "init: for cloning the xbps-src repository"
  echo "install <package_name> | i <package_name>"
  echo "search <package_name> | s <package_name>"
  exit 1
fi

argumant=$1
packageName=$2

if [ "$argumant" = "help" ] || [ "$argumant" = "h" ]; then
  echo "init: for cloning the xbps-src repository"
  echo "install <package_name> | i <package_name>"
  echo "search <package_name> | s <package_name>"
  exit 1
fi

if [ "$argumant" = "search" ] || [ "$argumant" = "s" ]; then

  ls ~/.packages/void-packages/srcpkgs/ | grep "$packageName"
  exit 1
fi

if [ "$argumant" = "init" ]; then
  mkdir ~/.packages
  git clone https://github.com/void-linux/void-packages ~/.packages
  exit 1
fi

if [ "$argumant" = "install" ] || [ "$argumant" = "i" ]; then
  cd ~/.packages/void-packages
  git pull
  ./xbps-src pkg "$packageName"
  xi "$packageName"
  exit 1
fi
