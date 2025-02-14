#!/usr/bin/env sh
mkdir -p .cache
cd .cache
if [ ! -f google-java-format-1.15.0-all-deps.jar ]
then
    curl -LJO "https://github.com/google/google-java-format/releases/download/v1.15.0/google-java-format-1.15.0-all-deps.jar"
    chmod 755 google-java-format-1.15.0-all-deps.jar
fi
cd ..

changed_java_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*java$" )
echo $changed_java_files
java -jar .cache/google-java-format-1.15.0-all-deps.jar --aosp --replace $changed_java_files
