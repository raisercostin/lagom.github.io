sbt clean web-stage

cd target/web
mv target/web/stage/.gitlab-ci.yml target/web/.gitlab-ci.yml
git init
git add .
git commit -m "Website build"

echo Push the repo to the master branch of the main repo
git push ../.. master:master -f

echo Push the repo to the website
cd ../..
git push origin master:master -f
