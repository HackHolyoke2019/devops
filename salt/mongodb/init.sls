# Install MongoDB

{{ pillar.mongodb.yum_repo_file }}:
  file.managed:
    - source: salt://mongodb/mongodb-org-4.2.repo

{{ pillar.mongodb.pkg }}:
  pkg.installed:
    - require:
      - file: {{ pillar.mongodb.yum_repo_file }}
