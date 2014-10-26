{%  set filename = 'selenium-server-standalone-' ~ salt['pillar.get']('selenium:file_version','2.43.1') ~ '.jar'  %}
{%  set directory = salt['pillar.get']('selenium:dir_version','2.43')  %}

selenium-deps:
  pkg.installed:
    - pkgs:
      - curl

get-selenium:
  cmd.run:
    - user: root
    - group: root
    - cwd: /usr/local/bin
    - name: curl -O http://selenium-release.storage.googleapis.com/{{ directory }}/{{ filename }}
    - unless: test -f /usr/local/bin/{{ filename }}
    - require:
      - pkg: selenium-deps

make-selenium-executable:
  cmd.run:
    - user: root
    - group: root
    - cwd: /usr/local/bin
    - name: chmod ug+x {{ filename }}
    - onlyif: test -f /usr/local/bin/{{ filename }}
    - require:
      - cmd: get-selenium

make-selenium-symbolic-link:
  file.symlink:
    - name: /usr/local/bin/selenium-server-standalone.jar
    - target: /usr/local/bin/{{ filename }}
    - require:
      - cmd: get-selenium

/usr/local/bin/start-selenium:
  file.managed:
    - source: salt://files/start_selenium_script
    - user: root
    - group: root
    - mode: 755
    - unless: test -f /usr/local/bin/start-selenium
    - require:
      - file: make-selenium-symbolic-link
