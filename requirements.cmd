SET PROJECT_PATH=%cd%

cd %PROJECT_PATH%

IF NOT EXIST "%PROJECT_PATH%\ansible" mkdir ansible
cd "%PROJECT_PATH%\ansible"

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\" mkdir roles
cd roles

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-debian-dawn" git clone https://github.com/orlissenberg/ansible-debian-dawn.git

REM System
IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-docker" git clone https://github.com/orlissenberg/ansible-docker.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-iptables" git clone https://github.com/orlissenberg/ansible-iptables.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-iptables" git clone https://github.com/orlissenberg/ansible-supervisord.git

REM Languages
IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-go" git clone https://github.com/orlissenberg/ansible-go.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-oracle-java" git clone https://github.com/orlissenberg/ansible-oracle-java.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-php" git clone https://github.com/orlissenberg/ansible-php.git

REM Development tools
IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-oh-my-zsh" git clone https://github.com/orlissenberg/ansible-oh-my-zsh.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-intellij-idea" git clone https://github.com/orlissenberg/ansible-intellij-idea.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-nodejs" git clone https://github.com/orlissenberg/ansible-nodejs.git

REM Web server
IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-nginx" git clone https://github.com/orlissenberg/ansible-nginx.git

REM Database
IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-mariadb" git clone https://github.com/orlissenberg/ansible-mariadb.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-mysql" git clone https://github.com/orlissenberg/ansible-mysql.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-db-maintenance" git clone https://github.com/orlissenberg/ansible-db-maintenance.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-postgresql" git clone https://github.com/orlissenberg/ansible-postgresql.git

REM Elastic
IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-elasticsearch" git clone https://github.com/orlissenberg/ansible-elasticsearch.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-kibana" git clone https://github.com/orlissenberg/ansible-kibana.git

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-logstash" git clone https://github.com/orlissenberg/ansible-logstash.git

REM Various

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\ansible-mumble" git clone https://github.com/orlissenberg/ansible-mumble.git

cd "%PROJECT_PATH%"
