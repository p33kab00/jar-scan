#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo "Usage:"
    echo "$ ./jar-crack.sh /dev/lib/ org.apache.xerces.jaxp.DocumentBuilderFactoryImpl"
    echo "$ ./jar-crack.sh /dev/lib/ META-INF/services/.*BuilderFactory"
    exit 1
fi

LIB="$1"
PATTERN1="$2"
PATTERN2=$(echo -n "$2" | tr "." "/")

shopt -s globstar

i=0
for summit in $LIB/**/*.jar;
do
  i=$((i+1))
done

echo "[*] jar-scan 0.1"
echo "[*] by p33kab00 (mudnorb@gmail.com)"
printf "[*] # of JARs: $i\n\n"

stp=$((100*100/i))

i=0
for filename in $LIB/**/*.jar;
do
  i=$((i+1))
  match=$(jar tf $filename | egrep -i "$PATTERN1|$PATTERN2")
  if [ "$(wc -c <<< $match)" -gt "1" ]; then
    printf "\033[K"
    printf "[+] $filename contains:\n"
    sed "s/^/    /g" <<< $match
    printf "\n"
  fi
  sum=$((stp*i))
  pct=$(echo "$sum" | sed 's/..$//')
  printf "[%s%%]\r" $pct
done
printf "\033[K"
printf "Done!\n"
