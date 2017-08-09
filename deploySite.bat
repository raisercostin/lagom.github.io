echo Builds and deploys the website to www.lagomframework.com
set remote="origin"
set deployBranch="master"

echo Build the website
sbt clean web-stage

# Make the website a git repo
cd target/web/stage
git init
git add .
git commit -m "Website build"

echo Push the repo to the master branch of the main repo
rem git push ../../.. master:%deployBranch% -f
git push ../../.. master:master -f

echo Push the repo to the website
cd ../../..
rem git push %remote% %deployBranch%:master -f
git push origin master:master -f
