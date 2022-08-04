FetchContent_Declare(
    gcc-arm-none-eabi-10.3-2021.10-x86_64-linux
    URL https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
)

FetchContent_Declare(
    stm32-cmake
    GIT_REPOSITORY https://github.com/ObKo/stm32-cmake.git
    GIT_TAG v2.1.0
)

FetchContent_Declare(
    cmsis-svd
    GIT_REPOSITORY https://github.com/posborne/cmsis-svd.git
    GIT_TAG master
)