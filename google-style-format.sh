#!/usr/bin/env sh

VERSION=1.15.0
JAR_FILE=google-java-format-$VERSION-all-deps.jar

mkdir -p .cache
cd .cache
if [ ! -f $JAR_FILE ]
then
    curl -LJO "https://github.com/google/google-java-format/releases/download/v$VERSION/$JAR_FILE"
    chmod 755 $JAR_FILE
fi
cd ..

CHANGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*java$" )
echo CHANGED FILES = $CHANGED_FILES
java \
  --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
  -jar .cache/$JAR_FILE --replace --aosp $CHANGED_FILES
