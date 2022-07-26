#!/bin/sh
LOGDIR=/root/auto_shell/shut_daily/log
export LOGDIR

LOGFILENAME=shutdown_daily
SHORI_NAME="定期シャットダウン"

export LOGFILENAME

NOWDATE=`date '+%F'`.log
NOWTIME=`date '+%Y-%m-%d %H:%M:%S'`
PREFIX=`date '+%m%d%H%M'`

# 開始メッセージ
echo ${NOWTIME} STA "${SHORI_NAME}"  >> ${LOGDIR}/${LOGFILENAME}_${NOWDATE}

/sbin/shutdown

# 終了メッセージ
echo ${NOWTIME} END "${SHORI_NAME}"  >> ${LOGDIR}/${LOGFILENAME}_${NOWDATE}

exit ${EXIT_NORMAL}

