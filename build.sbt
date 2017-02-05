name := "common-finagle-thrift"

version := "1.0"

organization := "com.jxjxgo.common"

scalaVersion := "2.11.8"

resolvers += "twitter-repo" at "http://maven.twttr.com"

libraryDependencies ++= Seq(
  "org.apache.thrift" % "libthrift" % "0.9.2",
  "com.twitter" %% "scrooge-core" % "4.6.0" exclude("com.twitter", "libthrift"),
  "com.twitter" %% "finagle-thrift" % "6.34.0" exclude("com.twitter", "libthrift"),
  "ch.qos.logback" % "logback-classic" % "1.1.7",
  "com.jxjxgo.common" % "common-utils_2.11" % "1.0"
)
