#!/bin/bash

function sync_overlays {
  local overlays=(\
    "guru"\
    "xarblu-overlay"\
    "riey"\
  )

  local overlay_types=(\
    "git"\
    "git"\
    "git"\
  )

  local overlay_urls=(\
    "https://github.com/gentoo-mirror/guru.git"\
    "https://github.com/gentoo-mirror/xarblu-overlay.git"\
    "https://github.com/Riey/overlay"\
  )

  if ! command -v emaint $ > /dev/null || ! command -v eselect repository $ > /dev/null; then
    echo "emaint or eselect repository not installed"
    echo "emerge gentoolkit, eselect-repository ..."

    sudo emerge -vq app-portage/gentoolkit app-eselect/eselect-repository
  fi

  if [ ! -e $ESELECT_REPO ]; then
    sudo mkdir -p $ESELECT_REPO
  fi

  for index in ${!overlays[*]}; do
    if ! grep -q "${overlays[$index]}" "$ESELECT_REPO";then
      if ! eselect repository list | grep -q "\[${overlays[$index]}\]"; then
        sudo eselect repository add ${overlays[$index]} ${overlay_types[$index]} ${overlay_urls[$index]}
      fi

      echo "overlay sync"
      sudo eselect repository enable ${overlays[$index]}
      sudo emaint sync -r ${overlays[$index]}
    fi
  done
}

function sync_overlays_test {
  local overlays=(\
    "guru"\
    "xarblu-overlay"\
    "riey"\
  )

  echo -e "\e[1msync_overlays test\e[0m"

  if ! command -v emaint $ > /dev/null; then
    echo "cannot execute \"emaint\"!"
    echo "test failed ..."
    exit 1
  fi

  if ! command -v eselect repository $ > /dev/null; then
    echo "cannot execute \"eselect repository\"!"
    echo "test failed ..."
    exit 1
  fi

  for index in ${!overlays[*]}; do
    if ! grep -q "\[${overlays[$index]}\]" "$ESELECT_REPO"; then
      echo "${overlays[$index]} repository not found ..."
      echo "test failed ..."
      exit 1
    fi
  done

  echo -e "\e[1mpassed\e[0m"
}
