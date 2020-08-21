#!/usr/bin/env bash
# place this script in project/android/app/
cd ..
# fail if any command fails
set -e
# debug log
set -x

cd ..
# choose a different release channel if you want - https://github.com/flutter/flutter/wiki/Flutter-build-release-channels
# stable - recommended for production

git clone -b stable https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor
flutter build apk --release

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_

# copy the APK where AppCenter will find it
# mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_

# copy the AAB where AppCenter will find it
# mkdir -p android/app/build/outputs/bundle/${APP_ENVIRONMENT}Release/; mv build/app/outputs/bundle/${APP_ENVIRONMENT}Release/app-$APP_ENVIRONMENT-release.aab $_ 