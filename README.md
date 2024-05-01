# ansible_copy_from_github

This play will download some content from github, specifically some `raw code` and will save it in a remote machine.

To set the remote code and file name that will be saved, you can change as below
```
  vars:
    github_links:
      - url: https://raw.githubusercontent.com/Qikfix/rpmdb_check/main/rpmdb_check.sh
        filename: rpmdb_check.sh
```

Also, you will notice that some commands will be executed on the remote server `delegate_to: remote_server`
```
    - name: Ensure the directory {{ remote_dir }} is present remotely
      delegate_to: remote_server
      ansible.builtin.file:
        path: "{{ remote_dir }}"
        state: directory
        mode: '0755'
```
Here, you can use two approaches

1. Set the FQDN of the server in front of `delegate_to`

or

2. In the inventory file, you can set as below. Set first the alias and after `ansible_host`, you can set the FQDN.
```
remote_server ansible_host=REMOTE_SERVER_FQDN_HERE
```

Finally, just call the bash script. It will create the virtual environment, it will install ansible and will call the play `main.yml`

Special thanks to my friend Pablo Hess!

I hope you enjoy it.