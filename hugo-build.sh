#Build Hugo

here=$(pwd)

package="github.com/gohugoio/hugo"

export CGO_ENABLED=0
export GO_EXTLINK_ENABLED=0

if ! hash govendor 2>/dev/null
then
    go get -u -v github.com/kardianos/govendor
fi

# Install hugo for the first time so that the ${GOPATH}/src/${package}
# directory gets populated.
if [[ ! -d "${GOPATH}/src/${package}" ]] || ( ! hash hugo 2>/dev/null )
then
    go get -u -v ${package}
fi

# Update to hugo master branch
cd "${GOPATH}/src/${package}" || exit
git fetch --all # fetch new branch names if any
git checkout master
# git fetch --all
# Force update the vendor file in case it got changed
git reset --hard origin/master

# Synchronize all the dependent packages as per the just updated vendor file
govendor sync

# Update the goorgeous package to its master branch
# You can comment out the below line if you do not need to fetch the
# latest version of goorgeous.
govendor fetch github.com/chaseadamsio/goorgeous
# govendor fetch github.com/chaseadamsio/goorgeous@=fixNewlineParagraphs

commithash=$(git rev-parse --short HEAD 2>/dev/null)
builddate=$(date +%FT%T%z)
go install -v \
   -ldflags "-X ${package}/hugolib.CommitHash=${commithash} \
             -X ${package}/hugolib.BuildDate=${builddate}" \
   ${package}

echo "Hugo Version Check:"

cd "${here}" || exit
