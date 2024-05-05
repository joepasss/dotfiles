#!/bin/bash

# test scripts
source $SCRIPT_DIR/test_scripts/copy_configs_test.sh
source $SCRIPT_DIR/test_scripts/pre_install_test.sh
source $SCRIPT_DIR/test_scripts/sync_overlays_test.sh
source $SCRIPT_DIR/test_scripts/unmask_packages_test.sh
source $SCRIPT_DIR/test_scripts/write_use_flags_test.sh
source $SCRIPT_DIR/test_scripts/install_packages_test.sh

function test() {
  local test_arg=$1

  print_red "INIT SCRIPT TEST"
  echo -e "\e[1m\e[30m----------------\e[0m\n"

  pre_install
  pre_install_test
  
  # copy_configs
  copy_configs_test

  sync_overlays
  sync_overlays_test

  # unmask_packages
  unmask_packages_test

  # write_use_flags
  write_use_flags_test
  
  install_packages
  install_packages_test
}
