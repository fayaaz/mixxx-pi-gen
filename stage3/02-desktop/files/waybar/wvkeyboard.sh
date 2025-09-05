if [[ $(pgrep wvkbd-mobintl) ]]  ; then
  kill -s SIGRTMIN $(pgrep wvkbd-mobintl)
else
  nohup /usr/bin/wvkbd-mobintl &> /dev/null &
fi
