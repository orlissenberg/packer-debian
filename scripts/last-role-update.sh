#!/usr/bin/env bash

# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for path in ${CURRENT_DIR}/../ansible/roles/*; do
    [ -d "${path}" ] || continue # if not a directory, skip
    cd ${path}

    # https://stackoverflow.com/questions/7853332/how-to-change-git-log-date-formats
    latest=`git --no-pager log -1 --date=iso --pretty=format:%cd`
    base=`basename ${path}`
    # echo "[${latest}] ${base}"
done

python << EOF
import os
import datetime
import subprocess
import time

rootdir = '${CURRENT_DIR}/../ansible/roles'
rootdir = os.path.abspath(rootdir)

def unix_compare(x, y):
  if x['unix'] > y['unix']:
    return 1
  elif x['unix'] == y['unix']:
    return 0
  else:  #x < y
    return -1

gits = [];
for name in os.listdir(rootdir):
  path = os.path.join(rootdir, name)

  if (os.path.isdir(path) and os.path.isdir(path + "/.git")):
    proc = subprocess.Popen(['git', '--no-pager', 'log', '-1', '--date=short', '--pretty=format:%cd'],stdout=subprocess.PIPE, cwd=path)

    for line in proc.stdout:
      dt = datetime.datetime.strptime( line.rstrip(), "%Y-%m-%d" );
      gits.append({ 'unix' : time.mktime(dt.timetuple()), 'name' : name })

gits.sort(unix_compare, reverse=False)



for g in gits:
  dts = datetime.datetime.fromtimestamp(g['unix']).strftime('%Y-%m-%d');
  print "[" + dts + "] " + g['name']

EOF
