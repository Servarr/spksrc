APP_LOWER="radarr"
APP_UPPER="Radarr"

GROUP="sc-download"

USR_LIB="/usr/lib/${APP_LOWER}"
PID_FILE="${SYNOPKG_PKGVAR}/${APP_LOWER}.pid"

# Some versions include bwrap to create a chroot container with newer libraries.
# If the bwrap binary is in the package, use the chroot
BWRAP="${SYNOPKG_PKGDEST}/bin/bwrap"

if [ -f "${BWRAP}" ]; then
    APP="${USR_LIB}/bin/${APP_UPPER}"
    CONFIG_DIR="/var/lib/${APP_LOWER}"
    SERVICE_COMMAND="${BWRAP} --bind ${SYNOPKG_PKGDEST}/rootfs / --proc /proc --dev /dev --bind ${SYNOPKG_PKGDEST}${USR_LIB} ${USR_LIB} --bind ${SYNOPKG_PKGVAR} ${CONFIG_DIR} --bind /volume1 /volume1 --setenv HOME ${SYNOPKG_PKGVAR} ${APP} --nobrowser --data=${CONFIG_DIR}"
else
    APP="${SYNOPKG_PKGDEST}${USR_LIB}/bin/${APP_UPPER}"
    SERVICE_COMMAND="env HOME=${SYNOPKG_PKGVAR} LD_LIBRARY_PATH=${SYNOPKG_PKGDEST}/lib ${APP} --nobrowser --data=${SYNOPKG_PKGVAR}"
fi

SVC_BACKGROUND=y

fix_permissions ()
{
    if [ ${SYNOPKG_DSM_VERSION_MAJOR} -lt 7 ]; then
        if [ -f "${BWRAP}" ]; then
            chown root:root "${BWRAP}"
            chmod u+s "${BWRAP}"
        fi

        set_unix_permissions "${SYNOPKG_PKGVAR}"
    fi
}

service_postinst ()
{
    # Move config.xml to .config
    mv ${SYNOPKG_PKGDEST}/app/config.xml ${SYNOPKG_PKGVAR}

    fix_permissions
}

service_postupgrade ()
{
    # Make Radarr do an update check on start to avoid possible Radarr
    # downgrade when synocommunity package is updated
    touch ${SYNOPKG_PKGVAR}/update_required

    fix_permissions
}
