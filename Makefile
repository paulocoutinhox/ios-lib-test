ROOT_DIR=${PWD}

.DEFAULT_GOAL := help

# general
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- clean"
	@echo "- build"
	@echo "- install"
	@echo "- test"
	@echo ""

clean:
	rm -rf library/build/
	rm -rf out/

build:
	# debug
	rm -rf library/build/Debug
	mkdir -p library/build/Debug

	cd library/build/Debug && \
	    cmake ../../ \
	    -G "Xcode" \
		-DCMAKE_BUILD_TYPE=Debug \
		-DCMAKE_TOOLCHAIN_FILE=cmake/ios.toolchain.cmake \
		-DPLATFORM=OS64COMBINED \
		-DENABLE_VISIBILITY=TRUE \
		-DENABLE_BITCODE=TRUE \
		-DENABLE_ARC=TRUE

	cd library/build/Debug && cmake --build . --config Debug
	lipo -info library/build/Debug/lib/Debug/libcpp_lib_test.a

	# release
	rm -rf library/build/Release
	mkdir -p library/build/Release

	cd library/build/Release && \
	    cmake ../../ \
	    -G "Xcode" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_TOOLCHAIN_FILE=cmake/ios.toolchain.cmake \
		-DPLATFORM=OS64COMBINED \
		-DENABLE_VISIBILITY=TRUE \
		-DENABLE_BITCODE=TRUE \
		-DENABLE_ARC=TRUE

	cd library/build/Release && cmake --build . --config Release
	lipo -info library/build/Release/lib/Release/libcpp_lib_test.a

install:
	# debug
	cd library/build/Debug && \
	  cmake --build . --config Debug --target install

	lipo -info out/Debug/lib/libcpp_lib_test.a

	# release
	cd library/build/Release && \
	  cmake --build . --config Release --target install
	  
	lipo -info out/Release/lib/libcpp_lib_test.a

test:
	cd projects/LibTest && \
		xcodebuild \
		-project LibTest.xcodeproj \
		-scheme LibTest \
		-sdk iphonesimulator \
		-destination 'platform=iOS Simulator,name=iPhone 8' \
		test
		