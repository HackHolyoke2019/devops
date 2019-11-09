# Create and configure users

{% for _, user in pillar['users'].items() %}
# Create gorup
{{ user.name }}_group:
  group.present:
    - name: {{ user.name }}
    - gid: {{ user.id }}

# Create user
{{ user.name }}_user:
  user.present:
    - name: {{ user.name }}
    - uid: {{ user.id }}
    - gid: {{ user.id }}
    {%- if 'groups' in user %}
    - groups: 
      {%- for group in user.groups %}
      - {{ group }}
      {%- endfor %}
    {%- endif %}
    - require:
      - group: {{ user.name }}_group

# Add SSH key
{% set ssh_dir = '/home/' + user.name + '/.ssh' %}

{{ ssh_dir }}:
  file.directory:
    - makedirs: true
    - dir_mode: 700
    - user: {{ user.name }}
    - group: {{ user.name }}
    - require:
      - user: {{ user.name }}_user

{{ ssh_dir }}/authorized_keys:
  file.managed:
    - contents: {{ user.ssh_public_key }}
    - mode: 600
    - user: {{ user.name }}
    - group: {{ user.name }}
    - require:
      - file: {{ ssh_dir }}
{% endfor %}
