#!/bin/bash
LIBFFMPEG_PATH=/usr/lib/chromium/libffmpeg.so # add libffmpeg file path
OPERA_PATH=/var/lib/flatpak/app/com.opera.Opera/x86_64/stablee/ # add opera browser path(flatpak)
echo "+-------------------------------------------------------------------+"
echo " "

if [ -e $LIBFFMPEG_PATH ]; then # check libffmpeg.so exists
    echo "libffmpeg.so file found."
    echo "path: $LIBFFMPEG_PATH"

    echo " "
    echo "+--------------------------------+"
    echo " "
    if [ -e $OPERA_PATH ]; then
        echo "opera path found."
        FILES_DIR=$( find $OPERA_PATH -type d -name 'files' ) #find opera files dir
        if [[ -d "$FILES_DIR" ]]; then
            echo "files directory found."
            echo "$FILES_DIR"
            if [[ -d "${FILES_DIR}/opera" ]]; then
                echo "files/opera directory found."

                if [[ -d "${FILES_DIR}/opera/lib_extra" ]]; then
                    echo "files/opera/lib_extra directory found."

                    if [[ -f "${FILES_DIR}/opera/lib_extra/libffmpeg.so" ]]; then
                        echo "libffmpeg.so file already exists"
                        exit 0
                    else
                        echo "Copying libffmpeg.so"
                        sudo cp $LIBFFMPEG_PATH "${FILES_DIR}/opera/lib_extra"
                        exit 0
                    fi

                else
                    echo "Creating lib_extra Dir"
                    sudo mkdir "${FILES_DIR}/opera/lib_extra"

                    echo "Copying libffmpeg.so"
                    sudo cp $LIBFFMPEG_PATH "${FILES_DIR}/opera/lib_extra"
                    exit 0
                fi
            else
                echo "files/opera directory not found"
                exit 1
            fi

        else
            echo "files directory not found"
            exit 1
        fi
        echo " "
        echo "+--------------------------------+"
    else
        echo "opera directory not found."
        exit 1
    fi

    echo " "
    echo "+-------------------------------------------------------------------+"

else
    echo "libffmpeg.so does not exists.install chromium browser(not flatpack)"
    exit 1
    echo " "
    echo "+-------------------------------------------------------------------+"
fi
