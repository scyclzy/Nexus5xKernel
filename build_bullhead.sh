mkdir AOSP
export AOSP_HOME=$PWD/AOSP
mkdir -p $AOSP_HOME/android/platform/prebuilts/gcc/linux-x86/aarch64
git clone https://github.com/scyclzy/aarch64-linux-android-4.9.git $AOSP_HOME/android/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
mkdir -p $AOSP_HOME/android/kernel
git clone https://github.com/scyclzy/msm.git $AOSP_HOME/android/kernel/msm
export PATH=$AOSP_HOME/android/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-
cd msm
git checkout -b android-msm-bullhead-3.10-marshmallow-mr1 origin/android-msm-bullhead-3.10-marshmallow-mr1
git reset --hard ea58e70
export PATH=$AOSP_HOME/make-3.81:$PATH
make bullhead_defconfig
make
