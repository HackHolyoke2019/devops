{% set fullname = 'node-v13.1.0-linux-x64' %}

nodejs:
  download_url: https://nodejs.org/dist/v13.1.0/{{ fullname }}.tar.xz
  download_hash: 2eecb5a4b7975c3b406bee36b12c9a29e8bedf9553c88cad310b8f076db00881
  download_dir: /opt/nodejs/
  bin_dir: /opt/nodejs/{{ fullname }}/bin
  profile_file: /etc/profile.d/nodejs.sh
