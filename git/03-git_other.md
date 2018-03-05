# Git basic usage

## Others
### Git Rebase
    $ git rebase upstream/master ( git rebase master )
##### Then resolve conflict and add the changed files
    $ git add *
##### Continue rebase
    $ git rebase --continue
##### We can stop the rebase anytime by
    $ git rebase abort
##### Git log:
##### Commit A
##### Commit B
##### Commit c
##### Commit O
##### merge commit A, B and C to X, execute the following command and change the front of B, C is s,
##### exit rebase and update the commit. Then it will be changed to Commit X, Commit O
    $ git rebase -i Commit O
  
### Git cherry-pick can get commit from other patch
    $ git cherry-pick commit_id
### Git format-patch can patch a commit
    $ git format-patch -1
### Git am *.patch can use a .patch file
    $ git am *.patch
### Git blame can search the author of the code
    $ git blame xx/../yy.java | grep zz
### Git merge --squash
##### Merge several commits from branch A to B
    $ Git merge --squash A
