mkdir -p src\docs
sbt clean web-stage

rem gitlab really want the stage to be called public. maybe `stage` is a special word in `.gitlab-ci.yml`
cd target/web
move stage public
move public\.gitlab-ci.yml .gitlab-ci.yml
git init
git add public
git add .gitlab-ci.yml
git commit -m "Website build"

echo Push the repo to the master branch of the main repo
git push ../.. master:master -f

echo Push the repo to the website
cd ../..
git push origin master:master -f
