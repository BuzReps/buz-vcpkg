vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO sqliteai/liteparser
	REF 1.0.0
	SHA512 4d309970712b919fd20a05bf3e36f4c315e5e1951ff1cbb6644fa892951187ea5610f2d2f2e7eeddf79e12451815eed1f61a45500b307092be8eae2b476592b7
	HEAD_REF master
)
file(COPY
	"${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt"
	"${CMAKE_CURRENT_LIST_DIR}/Config.cmake.in"
	DESTINATION "${SOURCE_PATH}"
)
vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(
	PACKAGE_NAME "SQLiteAILiteparser"
	CONFIG_PATH "lib/cmake/SQLiteAILiteparser"
)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

