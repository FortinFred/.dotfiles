#!/bin/bash

JAVA_HOME=~/tools/jdk

installHotswapJDK() {
  wget https://cache-redirector.jetbrains.com/intellij-jbr/jbr-17.0.12-linux-x64-b1207.37.tar.gz -O /tmp/jbr.tar.gz
  rm -rf $JAVA_HOME
  mkdir -p $JAVA_HOME
  tar -xvf /tmp/jbr.tar.gz --strip-components=1 -C $JAVA_HOME
  rm /tmp/jbr.tar.gz

  mkdir -p $JAVA_HOME/lib/hotswap
  wget https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-2.0.1/hotswap-agent-2.0.1.jar -O $JAVA_HOME/lib/hotswap/hotswap-agent.jar
}

installHotswapJDK

dotfilesRC "
#Java
export JAVA_HOME=$JAVA_HOME
export PATH=\$JAVA_HOME/bin:\$PATH
"
