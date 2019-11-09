# Installs NodeJS

{{ pillar.nodejs.download_dir }}:
  archive.extracted:
    - source: {{ pillar.nodejs.download_url }}
    - source_hash: {{ pillar.nodejs.download_hash }}

{{ pillar.nodejs.profile_file }}:
  file.managed:
    - source: salt://nodejs/nodejs.sh
    - template: jinja
