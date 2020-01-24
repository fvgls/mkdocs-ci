#!/bin/sh

setup_git() {
  git config --global user.email "fannyvignolles@gmail.com"
  git config --global user.name "fvgls"
}

commit_website_files() {
  git checkout master
  git add . 
  git commit --message "Generating docs"
}

upload_files() {
  git remote add origin-pages https://${{MKDOCS_CI}}@github.com/fvgls/mkdocs-ci.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages docs 
}

setup_git
commit_website_files
upload_files
