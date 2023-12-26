#!/bin/bash

cd /etc/zabbix/
mkdir scripts
cd ./scripts

wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_agentes_presos.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_asterisk.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_asterisk_uptime.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_asteriskdb_users.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_conversao.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacao_30.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacao_ontem.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacao_tamanho.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacoes_ontem.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_listener.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_manager.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_manutencao_samba.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_manutencao_sql.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_statys_by_sqlserver.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_wav.sh"
wget "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_sql.sh"

# Edit .conf file
chmod +x check_* && chmod +x default_sql.sh
echo -e "UserParameter=listener.isactive,/etc/zabbix/scripts/check_listener.sh\nUserParameter=asterisk.uptime,/etc/zabbix/scripts/check_asterisk_uptime.sh\nUserParameter=asterisk.isactive,/etc/zabbix/scripts/check_asterisk.sh\nUserParameter=asterisk.agentespresos,sudo /etc/zabbix/scripts/check_agentes_presos.sh\nUserParameter=samba.montagem,/etc/zabbix/scripts/check_montagem_samba.sh\nUserParameter=gravacao.ontem,/etc/zabbix/scripts/check_gravacoes_ontem.sh\nUserParameter=gravacao.mes,/etc/zabbix/scripts/check_gravacao_30.sh\nUserParameter=gravacao.conversao,/etc/zabbix/scripts/check_conversao.sh\nUserParameter=gravacao.tamanho,/etc/zabbix/scripts/check_gravacao_tamanho.sh\nUserParameter=database.manutencao,/etc/zabbix/scripts/check_manutencao_sql.sh\nUserParameter=database.asterisk,/etc/zabbix/scripts/check_asteriskdb_users.sh\nUserParameter=database.arquivos_gravacao,/etc/zabbix/scripts/check_status_by_sqlserver.sh\nUserParameter=dss.manager,sudo /etc/zabbix/scripts/check_manager.sh" >> /etc/zabbix/zabbix_agentd.conf

service zabbix-agent restart