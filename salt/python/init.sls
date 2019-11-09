# Install Python 3

# Install
{% for pkg in pillar['python']['pkgs'] %}
{{ pkg }}:
  pkg.installed
{% endfor %}

{% for pkg in pillar['python']['pip_pkgs'] %}
{{ pkg }}:
  pip.installed:
    - pip_bin: {{ pillar.python.pip3_bin }}
{% endfor %}
