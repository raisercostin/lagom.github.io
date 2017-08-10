sbt clean web-stage

cd target/web
mv stage public
mv public/.gitlab-ci.yml .gitlab-ci.yml
git init
git add public
git add .gitlab-ci.yml
git commit -m "Website build"

echo Push the repo to the master branch of the main repo
git push ../.. master:master -f

echo Push the repo to the website
cd ../..
git push origin master:master -f
