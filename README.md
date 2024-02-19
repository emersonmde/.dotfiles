# .dotfiles


## Usage

Clone the Repository:
```sh
git clone git@github.com:emersonmde/.dotfiles.git ~/.dotfiles && cd ~/.dotfiles
```

Execute the bootstrap script to install Ansible (and Homebrew on MacOS):
```sh
./ansible/bootstrap_ansible.sh
```

Run the Ansible playbook
```sh
ansible-playbook ansible/playbook.yml
```
