
#
# AppLauncherTest2
#

include(${TEST_BINARY_DIR}/AppLauncherTestPrerequisites.cmake)

#
# Attempt to run the application without the launcher
# Note that the application should NOT start since it has been built with SKIP_BUILD_RPATH ON.
# In other word, it means execute_process result_variable (error_code) should be greater than 0
#


# --------------------------------------------------------------------------
# Attempt to run the application

execute_process(
  COMMAND ${application}
  WORKING_DIRECTORY ${application_dir}
  ERROR_QUIET
  OUTPUT_QUIET
  RESULT_VARIABLE rv
  TIMEOUT 3
  )
  
if(NOT rv AND NOT APPLE)
  message(FATAL_ERROR "Since ${application_name} has been build with SKIP_BUILD_RPATH ON"
                      "Without the help of the launcher, the application shouldn't start !")
endif()
