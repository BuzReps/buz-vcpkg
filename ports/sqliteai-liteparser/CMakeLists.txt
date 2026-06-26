cmake_minimum_required(VERSION 4.0)

project(liteparser VERSION 1.0.0)

add_library(liteparser-obj OBJECT)
target_sources(
	liteparser-obj
	PRIVATE
	src/arena.c
	src/liteparser.c
	src/liteparser_internal.h
	src/lp_tokenize.c
	src/lp_unparse.c
	src/parse.c
)
target_sources(
	liteparser-obj PUBLIC
	FILE_SET HEADERS
	TYPE HEADERS
	BASE_DIRS src
	FILES
		src/arena.h
		src/liteparser.h
		src/parse.h
)
target_include_directories(
	liteparser-obj PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
	$<INSTALL_INTERFACE:include>)
set_target_properties(liteparser-obj PROPERTIES POSITION_INDEPENDENT_CODE ON)

add_library(liteparser-static STATIC)
target_link_libraries(liteparser-static PUBLIC liteparser-obj)
set_target_properties(liteparser-static PROPERTIES OUTPUT_NAME "liteparser")

add_library(liteparser-shared SHARED)
target_link_libraries(liteparser-shared PUBLIC liteparser-obj)
set_target_properties(liteparser-shared PROPERTIES OUTPUT_NAME "liteparser")

add_executable(liteparser-tool src/main.c)
target_link_libraries(liteparser-tool PRIVATE liteparser-static)
set_target_properties(liteparser-tool PROPERTIES OUTPUT_NAME "sqlparse")

# TODO: create regenerate parser target: src/lp_lempar.c src/lp_parse.y

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(package_name "SQLiteAILiteparser")
set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}")
set(generated_targets "${package_name}Targets.cmake")
set(generated_config "${package_name}Config.cmake")

install(
	TARGETS liteparser-static liteparser-shared liteparser-obj
	EXPORT liteparser-targets
	FILE_SET HEADERS DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
	RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
	ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
	LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
)
install(
	EXPORT liteparser-targets
	FILE "${generated_targets}"
	NAMESPACE SQLiteAI::
	DESTINATION "${config_install_dir}"
)

configure_package_config_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/${generated_config}"
	INSTALL_DESTINATION "${config_install_dir}"
)
install(
	FILES "${CMAKE_CURRENT_BINARY_DIR}/${generated_config}"
	DESTINATION "${config_install_dir}"
)

