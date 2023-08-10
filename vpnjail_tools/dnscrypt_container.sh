#!/bin/bash

WORK_DIR="${HOME}/.vpnjail"
CFG_FILE="${HOME}/.vpnjail/dnscrypt-proxy.toml"
mkdir -p ${WORK_DIR}

SANDBOX_NAME=${2}

if [[ -z "${SANDBOX_NAME}" ]]
then
	echo "No sandbox specified"
	exit 1
fi

SVC_NAME="dnscrypt-proxy"

PROC_NAME="${SANDBOX_NAME}-${SVC_NAME}"

FILE_ROOT=${WORK_DIR}/${PROC_NAME}
STDERR_FILE=${FILE_ROOT}.log
PID_FILE=${FILE_ROOT}.pid
LOCK_FILE=${FILE_ROOT}.lock

SVC_COMMAND="/usr/sbin/dnscrypt-proxy -config ${CFG_FILE}"

echo "Starting dnscrypt service with PID file ${PID_FILE}"
echo "Working directory: ${WORK_DIR}"
sudo daemonize -a -c "$WORK_DIR" -e "$STDERR_FILE" -p "$PID_FILE" -l "$LOCK_FILE" $SVC_COMMAND

${1}

echo "Killing dnscrypt service at $(cat $PID_FILE)"
sudo kill -s 15 $(cat $PID_FILE)
