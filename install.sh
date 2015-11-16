#!/bin/sh

TEMPDIR=${PWD}/tmp
FILESDIR=${PWD}/files
CREDENTIALSPATH=${PWD}/.credentials

verbose=

case "$1" in -v|--v|--ve|--ver|--verb|--verbo|--verbos|--verbose)
  verbose=1
  shift ;;
esac

if [ "$verbose" = 1 ]; then
  exec 4>&2 3>&1
else
  exec 4>/dev/null 3>/dev/null
fi

# Creates .credentials template if doesn't exists
if [ ! -f ${CREDENTIALSPATH} ]; then
  echo "GITEMAIL=''
GITNAME=''" > ${CREDENTIALSPATH}

  printf "\033[1;31mPlease fill in the file ${CREDENTIALSPATH}\033[0m\n" && exit
fi

# Loads sensitive informations like passwords or emails to variables.
# You should take care or make sure that this file is included in .gitignore.
echo >&3 "Loading credentials"
. ${PWD}/.credentials

# Creates temporary directory and copies there all available dotfiles.
mkdir ${TEMPDIR}
for f in ${FILESDIR}/*
do
  cp -f $f ${TEMPDIR}/.`basename $f`
done

# Parses files from temporary directory, finds @VARIABLES and changes them to corresponding values
# from .credentials file.
for f in ${TEMPDIR}/.*
do
  while read line
  do
    for word in $line; do
      echo $word | grep -q '@[A-Z]'

      if [ $? -eq 0 ] ;then
        value=$(eval "echo \${`echo $word | cut -c2-`}")

        if [ ! "${value}" ]; then
          printf "\033[1;31mYou should add value to ${word}\033[0m\n"
        else
          echo >&3 "Changing ${word} to ${value}"
          sed -i "s/${word}/${value}/g" ${f}
        fi
      fi
    done
  done < $f
done

echo >&3 "Copying files to your home directory"
cp ${TEMPDIR}/.* ~/ 2>&1 | grep -v 'omitting directory'

printf "\033[1;32mGreat! Everything is ok.\033[0m\n"

rm -R ${TEMPDIR}
