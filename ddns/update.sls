dns_packages:
  pkg.installed:
    - name: bind-utils


ddns_run_script:
   file.managed:
     - name: /var/tmp/dns-update.sh
     - source: salt://ddns/files/dns-update.sh 
     - user: root
     - mode: 755

update_dns:
   cmd.run:
     - name: /var/tmp/dns-update.sh


remove_dns_script:
   file.absent:
     - name: /var/tmp/dns-update.sh

