# Linux And MacOS 

build_dir=build
prefix_dir=prefix

rm -rf $build_dir
rm -rf $prefix_dir

# make
cmake -B $build_dir -S . -G Ninja -DBUILD_SHARED_LIBS=ON
if [ $? -ne 0 ]; then
    echo "Make Failed"
    exit $?
fi

# build
cmake --build $build_dir
if [ $? -ne 0 ]; then
    echo "Build Failed"
    exit $?
fi

# install
cmake --install $build_dir --prefix $prefix_dir
if [ $? -ne 0 ]; then
    echo "Install Failed"
    exit $?
fi
