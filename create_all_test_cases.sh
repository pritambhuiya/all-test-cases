#! /bin/bash

function create_function() {
  local function_name=$1
  local content="$2"

  echo -e "\nfunction ${function_name}() {\n${content}\n}"
}

function get_function_names() {
  local file_name=$1
  grep "^function " ${file_name} | cut -d" " -f2 | cut -d"(" -f1
}

function remove_all_test_cases_func() {
  local file_name=$1

  local line_no=$( grep -n "all_test_cases.*(" ${file_name} | cut -d":" -f1 )
  sed -i '' "$(( ${line_no} - 1 )),$ d" ${file_name}
}

function create_all_test_cases() {
  local file_name=$1

  remove_all_test_cases_func ${file_name} 2> /dev/null
  local func_names=$( get_function_names ${file_name} )

  create_function "all_test_cases" "${func_names}" >> ${file_name}
  echo -e "\nall_test_cases" >> ${file_name}
}

create_all_test_cases $1