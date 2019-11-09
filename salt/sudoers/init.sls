# Gives the sudo group access to sudo without a password
{{ pillar.sudoers.sudo_no_password_file }}:
  file.managed:
    - source: salt://sudoers/100-sudo-no-password
    - template: jinja
    - makedirs: true
    - check_cmd: visudo -c -f
