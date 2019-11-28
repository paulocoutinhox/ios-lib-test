ROOT_DIR=${PWD}

.DEFAULT_GOAL := help

# general
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- clean"
	@echo "- build"
	@echo "- test"
	@echo ""

clean:
	rm -rf library/build/
	rm -rf /usr/local/lib/libcpp_lib_test.a
	rm -rf /usr/local/include/library.hpp

build:
	rm -rf library/build/
	mkdir -p library/build/

	cd library/build && \
	    cmake ../ \
	    -G "Xcode" \
		-DCMAKE_TOOLCHAIN_FILE=cmake/ios.toolchain.cmake \
		-DPLATFORM=OS64COMBINED \
		-DENABLE_VISIBILITY=TRUE \
		-DENABLE_BITCODE=TRUE \
		-DENABLE_ARC=TRUE

	cd library/build &&	cmake --build . --config Debug
	lipo -info library/build/lib/Debug/libcpp_lib_test.a

	cd library/build &&	cmake --build . --config Release
	lipo -info library/build/lib/Release/libcpp_lib_test.a

install:
	cd library/build && \
	  cmake --build . --config Debug --target install

	cd library/build && \
	  cmake --build . --config Release --target install

test:
	cd projects/LibTest && \
	  xcodebuild \
		-project LibTest.xcodeproj \
		-scheme LibTestTests \
		-sdk iphonesimulator \
		-destination 'platform=iOS Simulator,name=iPhone 8' \
		test