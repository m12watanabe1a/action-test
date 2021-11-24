# Install C driver
mkdir -p ~/.local/src; cd ~/.local/src
git clone git@github.com:mongodb/mongo-c-driver.git -b 1.17.7
cd mongo-c-driver
python3 build/calc_release_version.py > VERSION_CURRENT
mkdir cmake-build; cd cmake-build
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$HOME/.local -DCMAKE_INSTALL_PREFIX=$HOME/.local ..
make -j8
make install


# Install Cxx driver
cd ~/.local/src
git clone git@github.com:mongodb/mongo-cxx-driver.git -b r3.6.5
cd mongo-cxx-driver/build
cmake -DCMAKE_BUILD_TYPE=Release -DBSONCXX_POLY_USE_BOOST=1 -DCMAKE_PREFIX_PATH=$HOME/.local -DCMAKE_INSTALL_PREFIX=$HOME/.local ..
make -j8
make install

