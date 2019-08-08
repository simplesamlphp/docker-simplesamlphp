#!/bin/bash

set -e

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
SOURCEPATH="$SCRIPTPATH/simplesamlphp"
ENV_FILE_SRC="$SCRIPTPATH/docker/config.yml"
ENV_FILE_DEST="$SCRIPTPATH/.docker.env"

CODE_SOURCE="git"

usage() { echo "Usage: $0 [-s <git|zip>] [-f]" 1>&2; exit 1; }
while getopts :fs: option
do
case "${option}"
in
s)
    CODE_SOURCE=${OPTARG}
    ((CODE_SOURCE == "git" || CODE_SOURCE == "zip")) || usage
  ;;
f)
  OVERWRITE="1"
  ;;
*)
  OVERWRITE="0"
esac
done

function parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
   awk -F"$fs" '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'"$prefix"'",vn, $2, $3);
      }
   }'
}

echo -n "Preparing env_file '$(realpath --relative-to="$SCRIPTPATH" "$ENV_FILE_DEST")' using '$(realpath --relative-to="$SCRIPTPATH" "$ENV_FILE_SRC")'... "
if [[ ! -f "$ENV_FILE_DEST" || $OVERWRITE == "1" ]]; then
  (parse_yaml "$ENV_FILE_SRC" > "$ENV_FILE_DEST") || exit 1;
  echo "OK"
else
  echo "Already exists! Use '-f' flag to overwrite."; exit 1;
fi

# Read env file
# shellcheck disable=SC1090
. "${ENV_FILE_DEST}"

echo -n "Preparing source code directory... ";
if [ -d "$SOURCEPATH" ]; then
  echo "Already created";
else
  echo "Cloning from git"
  git clone --branch "$SIMPLESAMLPHP_GIT_BRANCH" "$SIMPLESAMLPHP_GIT_REPO" "$SOURCEPATH"
fi

echo ""
echo "Done"
