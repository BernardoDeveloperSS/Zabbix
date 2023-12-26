#!/bin/bash

cd /etc/zabbix/
mkdir scripts
cd ./scripts

curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_agentes_presos.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_asterisk.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_asterisk_uptime.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_asteriskdb_users.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_conversao.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacao_30.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacao_ontem.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacao_tamanho.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_gravacoes_ontem.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_listener.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_manager.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_manutencao_samba.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_manutencao_sql.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_statys_by_sqlserver.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_wav.sh"
curl "https://raw.githubusercontent.com/BernardoDeveloperSS/Zabbix/main/linux.PABX/scripts/check_sql.sh"

# Edit .conf file
chmod +x check_* && chmod +x default_sql.sh
echo -e "UserParameter=listener.isactive,/etc/zabbix/scripts/check_listener.sh\nUserParameter=asterisk.uptime,/etc/zabbix/scripts/check_asterisk_uptime.sh\nUserParameter=asterisk.isactive,/etc/zabbix/scripts/check_asterisk.sh\nUserParameter=asterisk.agentespresos,sudo /etc/zabbix/scripts/check_agentes_presos.sh\nUserParameter=samba.montagem,/etc/zabbix/scripts/check_montagem_samba.sh\nUserParameter=gravacao.ontem,/etc/zabbix/scripts/check_gravacoes_ontem.sh\nUserParameter=gravacao.mes,/etc/zabbix/scripts/check_gravacao_30.sh\nUserParameter=gravacao.conversao,/etc/zabbix/scripts/check_conversao.sh\nUserParameter=gravacao.tamanho,/etc/zabbix/scripts/check_gravacao_tamanho.sh\nUserParameter=database.manutencao,/etc/zabbix/scripts/check_manutencao_sql.sh\nUserParameter=database.asterisk,/etc/zabbix/scripts/check_asteriskdb_users.sh\nUserParameter=database.arquivos_gravacao,/etc/zabbix/scripts/check_status_by_sqlserver.sh\nUserParameter=dss.manager,sudo /etc/zabbix/scripts/check_manager.sh" >> /etc/zabbix/zabbix_agentd.conf

service zabbix-agent restart