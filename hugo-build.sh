#!/data/data/com.termux/files/usr/bin/bash

# Build Hugo
# Base off of https://scripter.co/installing-bleeding-edge-hugo-goorgeous/ with some modifications.

# Saves current directory
here=$(pwd)

# Path data added to make sure install occurs properly. Path information has been added in .bash_profile
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

go get -u -v github.com/gohugoio/hugo

cd $GOPATH/src/github.com/gohugoio/hugo/

git fetch --all # fetch new branch names if any
git checkout master
# git fetch --all
# Force update the vendor file in case it got changed
git reset --hard origin/master

go get -u -v github.com/kardianos/govendor

# Synchronize all the dependent packages as per the just updated vendor file
govendor sync

# Update the goorgeous package to its master branch
# You can comment out the below line if you do not need to fetch the
# latest version of goorgeous.
govendor fetch github.com/chaseadamsio/goorgeous
# govendor fetch github.com/chaseadamsio/goorgeous@=fixNewlineParagraphs

# Specify that the build is static
export CGO_ENABLED=0
export GO_EXTLINK_ENABLED=0

# Build Hugo
package="github.com/gohugoio/hugo"
commithash=$(git rev-parse --short HEAD 2>/dev/null)
builddate=$(date +%FT%T%z)
go install -v \
   -ldflags "-X ${package}/hugolib.CommitHash=${commithash} \
             -X ${package}/hugolib.BuildDate=${builddate}" \
   ${package}

cd "${here}"

echo "Hugo installed!"
