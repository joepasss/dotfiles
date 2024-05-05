#!/bin/bash

function sync_overlays_test {
  local overlays=$(jq -c ".overlays[]" $JSON)
  local eselect_repo=$(cat $ESELECT_REPO)
  
  for overlay in $overlays; do
    local overlay_name=$(echo $overlay | jq -r ".name")
    local overlay_type=$(echo $overlay | jq -r ".type")
    local overlay_url=$(echo $overlay | jq -r ".url")

    if ! echo "$eselect_repo" | grep -q "\[$overlay_name\]"; then
      print_error "cannot find \"$overlay_name\" in \"$ESELECT_REPO\" file..."
      print_fail "SYNC_OVERLAYS"
      exit 1
    fi

    if ! echo "$eselect_repo" | grep -q "sync-type = $overlay_type"; then
      print_error "cannot find $overlay_name's overlay type in \"$ESELECT_REPO\" file..."
      print_fail "SYNC_OVERLAYS"
      exit 1
    fi

    if ! echo "$eselect_repo" | grep -q "sync-uri = $overlay_url"; then
      print_error "cannot find $overlay_name's overlay url in \"$ESELECT_REPO\" file..."
      print_fail "SYNC_OVERLAYS"
      exit 1
    fi
  done

  print_pass "SYNC_OVERLAYS"
}
