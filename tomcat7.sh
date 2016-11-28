#!/bin/bash
export JAVA_HOME=/app/jdk1.7.0_65
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar


export TOMCAT_HOME=/app/apache-tomcat-7.0.8
export PATH=$TOMCAT_HOME/bin:$PATH

exec $TOMCAT_HOME/bin/catalina.sh run