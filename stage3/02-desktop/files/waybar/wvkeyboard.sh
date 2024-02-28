if [[ $(pgrep wvkbd-mobintl) ]]  ; then
  kill -s SIGRTMIN $(pgrep wvkbd-mobintl)
else
  nohup /usr/bin/wvkbd-mobintl  -l nav,special,full --landscape-layers nav,special,full &> /dev/null &
fi
