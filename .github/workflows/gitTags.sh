#!/bin/bash
source $GITHUB_WORKSPACE/gradle.properties
#echo "version=$version"
#git pull > /dev/null

IFS='.' read -r -a array <<< "$version"
version_major=${array[0]}
version_minor=${array[1]}
version_patch=${array[2]}

LATEST_TAG=$(git describe --tags --abbrev=0)
#echo "LATEST_TAG=$LATEST_TAG"
IFS='.' read -r -a array <<< "$LATEST_TAG"
major=${array[0]}
minor=${array[1]}
patch=${array[2]}


if [ "$version_major" == "$major" ] && [ "$version_minor" == "$minor"  ]; then
	((patch++))
else
	major=$version_major
	minor=$version_minor
	patch=0
fi

NEW_TAG="${major}.${minor}.${patch}"
echo "$NEW_TAG"
