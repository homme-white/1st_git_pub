# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/homie/cmakeQuickStart

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/homie/cmakeQuickStart/build

# Include any dependencies generated for this target.
include CMakeFiles/c++.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/c++.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/c++.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/c++.dir/flags.make

CMakeFiles/c++.dir/main.cpp.o: CMakeFiles/c++.dir/flags.make
CMakeFiles/c++.dir/main.cpp.o: /home/homie/cmakeQuickStart/main.cpp
CMakeFiles/c++.dir/main.cpp.o: CMakeFiles/c++.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/homie/cmakeQuickStart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/c++.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/c++.dir/main.cpp.o -MF CMakeFiles/c++.dir/main.cpp.o.d -o CMakeFiles/c++.dir/main.cpp.o -c /home/homie/cmakeQuickStart/main.cpp

CMakeFiles/c++.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/c++.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/homie/cmakeQuickStart/main.cpp > CMakeFiles/c++.dir/main.cpp.i

CMakeFiles/c++.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/c++.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/homie/cmakeQuickStart/main.cpp -o CMakeFiles/c++.dir/main.cpp.s

# Object files for target c++
c_______OBJECTS = \
"CMakeFiles/c++.dir/main.cpp.o"

# External object files for target c++
c_______EXTERNAL_OBJECTS =

libc++.a: CMakeFiles/c++.dir/main.cpp.o
libc++.a: CMakeFiles/c++.dir/build.make
libc++.a: CMakeFiles/c++.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/homie/cmakeQuickStart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libc++.a"
	$(CMAKE_COMMAND) -P CMakeFiles/c++.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/c++.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/c++.dir/build: libc++.a
.PHONY : CMakeFiles/c++.dir/build

CMakeFiles/c++.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/c++.dir/cmake_clean.cmake
.PHONY : CMakeFiles/c++.dir/clean

CMakeFiles/c++.dir/depend:
	cd /home/homie/cmakeQuickStart/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/homie/cmakeQuickStart /home/homie/cmakeQuickStart /home/homie/cmakeQuickStart/build /home/homie/cmakeQuickStart/build /home/homie/cmakeQuickStart/build/CMakeFiles/c++.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/c++.dir/depend

