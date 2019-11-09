# Sets the MOTD
{{ pillar.motd.file }}:
  file.managed:
    - source: salt://motd/motd
