
# Radarr service setup

RADARR="${SYNOPKG_PKGDEST}/bin/Radarr"

# Radarr uses custom Config and PID directories
CONFIG_DIR="${SYNOPKG_PKGVAR}"
PID_FILE="${CONFIG_DIR}/radarr.pid"

GROUP="sc-download"
LEGACY_GROUP="sc-media"

SERVICE_COMMAND="env LD_LIBRARY_PATH=${SYNOPKG_PKGDEST}/lib ${RADARR} --nobrowser --data=${CONFIG_DIR}"
SVC_BACKGROUND=y

service_postinst ()
{
    if [ ${SYNOPKG_DSM_VERSION_MAJOR} -lt 7 ]; then
        set_unix_permissions "${CONFIG_DIR}"

        # If nessecary, add user also to the old group before removing it
        syno_user_add_to_legacy_group "${EFF_USER}" "${USER}" "${LEGACY_GROUP}"
        syno_user_add_to_legacy_group "${EFF_USER}" "${USER}" "users"
    fi
}

service_postupgrade ()
{
    # Make Radarr do an update check on start to avoid possible Radarr
    # downgrade when synocommunity package is updated
    touch ${CONFIG_DIR}/update_required

    if [ ${SYNOPKG_DSM_VERSION_MAJOR} -lt 7 ]; then
        set_unix_permissions "${CONFIG_DIR}"
    fi
}
