
# Radarr service setup

BWRAP="${SYNOPKG_PKGDEST}/bin/bwrap"
RADARR="/usr/lib/radarr/bin/Radarr"

# Radarr uses custom Config and PID directories
PID_FILE="${SYNOPKG_PKGVAR}/radarr.pid"

GROUP="sc-download"

# CONFIG_DIR is the directory inside the chroot
CONFIG_DIR="/var/lib/radarr"

SERVICE_COMMAND="${BWRAP} --bind ${SYNOPKG_PKGDEST}/rootfs / --proc /proc --dev /dev --bind ${SYNOPKG_PKGVAR} ${CONFIG_DIR} --bind /volume1 /volume1 --setenv HOME ${SYNOPKG_PKGVAR} ${RADARR} --nobrowser --data=${CONFIG_DIR}"
SVC_BACKGROUND=y

fix_permissions ()
{
    if [ ${SYNOPKG_DSM_VERSION_MAJOR} -lt 7 ]; then
        chown root:root "${BWRAP}"
        chmod u+s "${BWRAP}"
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
    touch ${CONFIG_DIR}/update_required

    fix_permissions
}
