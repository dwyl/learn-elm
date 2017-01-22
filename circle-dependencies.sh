# Installs sysconfcpus so we can make elm compile faster
# and limit the CPUS that elm uses to compile.
# See: https://github.com/elm-lang/elm-compiler/issues/1473#issuecomment-245704142
# and https://github.com/JamesHageman/whistlet-elm/blob/1bc50446987e3bcf92a9710698ae417652d7517f/circle-deps.sh
export INSTALL_PATH="$HOME/dependencies"

if [ ! -d $INSTALL_PATH/sysconfcpus/bin ]; then
  git clone https://github.com/obmarg/libsysconfcpus.git
  cd libsysconfcpus
  ./configure --prefix=$INSTALL_PATH/sysconfcpus
  make && make install
  cd ..
fi
