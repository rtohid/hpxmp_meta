
# Input arguments with default values
BUILD_TYPE=${1:-RelWithDebInfo}
CLEAN_BUILD=${2:-no}
CURRENT_DIR="${3:-$(realpath "$(dirname "$0")")}"
COMPILER=${4:-llvm}

# Paths setup
PREFIX="$CURRENT_DIR"/..
DEPENDENCIES="${PREFIX}/dependencies"

# Clone lulesh
LULESH_DIR=${PREFIX}/LULESH
# git clone -b build-with-omp git@github.com:Pansysk75/LULESH.git ${LULESH_DIR}

export OMP_LIB_PATH="${DEPENDENCIES}/llvm-project/openmp/cmake-install-omp/${BUILD_TYPE}/lib"
export OMP_INCLUDE_PATH="${DEPENDENCIES}/llvm-project/openmp/cmake-install-omp/${BUILD_TYPE}/include"

# Build lulesh
cd ${LULESH_DIR}
make clean && make
