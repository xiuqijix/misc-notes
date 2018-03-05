# Git basic usage

## Config information
### Config the user information and editor
    $ git config --global user.name "your_name"
    $ git config --global user.email "your_email@company.com"
    $ git config --global core.editor vim
### Config proxy
    $ git config --global --unset https.proxy
    $ git config --global https.proxy http://child-prc.intel.com:913
    $ git config --global http.proxy http://child-prc.intel.com:913
    $ git config --global -l
### Config cache to remember password
    $ git config --global credential.helper cache 'cache --timeout=3600'
