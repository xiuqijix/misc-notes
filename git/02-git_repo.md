# Git basic usage

## Clone a repository
### Clone a repository via https or ssh
    $ git clone https://github.com/<your_name>/<your_repo>.git
    $ git branch
    $ git checkout master
### Clone v2.8.1 branch code
    $ git clone -b v2.8.1 https://git.oschina.net/oschina/android-app.git
### Add remote upstream
    $ git remote add upstream https://github.com/crosswalk-project/web-testing-service.git
    $ git fetch upstream
    $ git merge upstream/master
### Create a new branch haha and merge upstream/master to haha
    $ git checkout -b haha
    $ git merge upstream/master
### Pull a origin branch gh-pages to local
    $ git checkout -b gh-pages origin/gh-pages
### Fetch remote master to new branch
    $ git fetch https://github.com/crosswalk-project/web-testing-service.git master
    $ git merge FETCH_HEAD

### Push branch
    $ git push origin
    $ git push origin xiuqi/de_json (xiuqi/de_json is a name of branch)

### Delete local branch
    $ git branch -D xiuqi/de_json
### Delete origin branch
    $ git push origin --delete branch_name
