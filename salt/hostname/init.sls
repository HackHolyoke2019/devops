# Set's the server's hostname

{{ pillar.hostname.file }}:
  file.managed:
    - contents: {{ pillar.hostname.name }}
