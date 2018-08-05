export PATH=${PATH}:$(pwd)/vcx/ci/scripts
OUTPUTDIR=output
DIR=vcx/wrappers/node

pushd $DIR
npm i
npm run compile
npm pack

rename \s/vcx-/vcx_/ *.tgz
rename \s/\\.tgz\$/_amd64\\.tgz/ *.tgz

find . -type f -name 'vcx_*.tgz' -exec create_npm_deb.py {} \;

popd
cp $DIR/vcx*.tgz $OUTPUTDIR
cp $DIR/vcx_*.deb $OUTPUTDIR

