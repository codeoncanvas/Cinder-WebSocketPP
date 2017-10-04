if( NOT TARGET Cinder-WebSocketPP )
    get_filename_component( CINDER-WEBSOCKETPP_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )
    get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

    FILE(GLOB_RECURSE CINDER-WEBSOCKETPP_SOURCES ${CINDER-WEBSOCKETPP_SOURCE_PATH} *.cpp)

    add_library( Cinder-WebSocketPP STATIC ${CINDER-WEBSOCKETPP_SOURCES} )

    target_include_directories( Cinder-WebSocketPP PUBLIC
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/base64/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/common/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/concurrency/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/config/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/extensions/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/extensions/permessage_deflate/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/http/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/http/impl/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/impl/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/logger/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/message_buffer/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/processors/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/random/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/roles/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/sha1/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/transport/asio/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/transport/asio/security/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/transport/base/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/transport/iostream/
        ${CINDER-WEBSOCKETPP_SOURCE_PATH}/websocketpp/transport/stub/
        )

    #set_target_properties( Cinder-WebSocketPP PROPERTIES LINKER_LANGUAGE CXX )

    # If Cinder included from this block:

    target_include_directories( Cinder-WebSocketPP SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

    if( NOT TARGET cinder )
        include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
        find_package( cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
    endif()

    target_link_libraries( Cinder-WebSocketPP PRIVATE cinder Asio )
endif()
