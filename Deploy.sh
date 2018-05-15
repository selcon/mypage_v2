#!/bin/bash
MYP_REPO=mypage_v2
ID=selcon
#DOM="kottn.me"


echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
rm -rf public
hugo
git add .

# Commit changes. for "${MYP_REPO}"
msg="rebuilding site `date +%F-%A`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master

# Commit changes. for "${ID}.github.io"
cd ..
git clone https://github.com/${ID}/${ID}.github.io
cd ${ID}.github.io && rm -rf * && cp -r ../${MYP_REPO}/public/* .
#echo ${DOM} > ./CNAME
git add .
git commit -m "$msg"
git push origin master

cd ..
rm -rf ${ID}.github.io
cd ${MYP_REPO}

