# Builds and deploys the website to www.lagomframework.com
set remote="origin"
set deployBranch="master"

# Build the website
sbt clean web-stage

# Make the website a git repo
cd target/web/stage
git init
git add .
git commit -m "Website build"

# Push the repo to the master branch of the main repo
git push ../../.. master:%deployBranch% -f

# Push the repo to the website
cd ../../..
git push %remote% %deployBranch%:master -f
