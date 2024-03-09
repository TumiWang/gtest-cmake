# Linux And MacOS 

build_dir=build
prefix_dir=prefix

rm -rf $build_dir
rm -rf $prefix_dir

# make
cmake -B $build_dir -S . -G Ninja -DBUILD_SHARED_LIBS=ON

# build
cmake --build $build_dir

# install
cmake --install $build_dir --prefix $prefix_dir
