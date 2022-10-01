#!/bin/sh
LOGDIR=/root/auto_shell/shut_daily/log
export LOGDIR

LOGFILENAME=shutdown_daily
SHORI_NAME="定期シャットダウン"
PERIOD=60

export LOGFILENAME

NOWDATE=`date '+%F'`.log
NOWTIME=`date '+%Y-%m-%d %H:%M:%S'`
PREFIX=`date '+%m%d%H%M'`

# 開始メッセージ
echo ${NOWTIME} STA "${SHORI_NAME}"  >> ${LOGDIR}/${LOGFILENAME}_${NOWDATE}

checkcount1=`find /var/log/httpd -name '*access_log' -mmin -${PERIOD} -print | wc -l`
checkcount2=`find /var/log/v2ray -name '*access*' -mmin -${PERIOD} -print | wc -l`

  if [[ ${checkcount1} -eq 0 && ${checkcount2} -eq 0 ]]; then
      echo ${NOWTIME} "There is no use of httpd or v2ray ${PERIOD} minutes ago. I will shutdown" >> ${LOGDIR}/${LOGFILENAME}_${NOWDATE}
      # /sbin/shutdown
  else
      echo ${NOWTIME} "There is someone use httpd or v2ray in ${PERIOD} minutes." >> ${LOGDIR}/${LOGFILENAME}_${NOWDATE}
  fi
# 終了メッセージ
echo ${NOWTIME} END "${SHORI_NAME}"  >> ${LOGDIR}/${LOGFILENAME}_${NOWDATE}

exit ${EXIT_NORMAL}

