#! /bin/bash
remote="origin"
deployBranch="master"

# Build the website
#sbt clean web-stage

echo "Fetching master"
git fetch origin master:master

echo 
echo "Prepare stage with master branch"
if [ -e target/web/stage2/.git ]
then
	echo "- pull"
	{
		cd target/web/stage2
		git pull origin
	}
else
	echo "- clone"
	(
		mkdir -p target/web/stage2
		cd target/web/stage2
		git init
		git remote add origin ../../..
		git fetch origin master
		git checkout master
		
		#git clone --branch master --single-branch ../../..
	)
fi

echo 
echo "Prepare changes"
mkdir -p target/web/stage3/public
mv target/web/stage2/.git target/web/stage3/
mv target/web/stage/* target/web/stage3/public/




echo 
echo "Prepare stage3 and commit"
{
	# Make the website a git repo
	cd target/web/stage3
	mv public/.gitlab-ci.yml gitlab-ci.yml
	git add --all .
	git commit -m "Website build"
	mv public/* ../stage/

	# Push the repo to the master branch of the main repo
	git push ../../.. master:$deployBranch
}

# Push the repo to the website
#cd ../../..
#git push $remote $deployBranch:master -f
