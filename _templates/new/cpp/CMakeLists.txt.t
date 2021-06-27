---
to: <%= name %>/CMakeLists.txt
---
cmake_minimum_required(VERSION 3.7)
project(<%= name %>)
set(CMAKE_CXX_STANDARD 17)

include_directories(
  include
)

add_executable(main src/main.cpp)
