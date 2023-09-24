# get the script current folder
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# loop on each file in $BASEDIR/resources and symlink it to the home folder
for file in $BASEDIR/resources/.*; do
    ln -s $file ~/.${file##*/}
done

# loop on each sh script in $BASEDIR/scripts and execute it
for file in $BASEDIR/scripts/*.sh; do
    bash $file
done
