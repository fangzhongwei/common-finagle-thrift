name := "common-finagle-thrift"

version := "1.1"

organization := "com.jxjxgo.common"

scalaVersion := "2.12.2"

resolvers += "twitter-repo" at "http://maven.twttr.com"
resolvers += "central-repo" at "http://central.maven.org/maven2"

libraryDependencies ++= Seq(
  "org.apache.thrift" % "libthrift" % "0.10.0",
  "net.codingwell" % "scala-guice_2.12" % "4.1.0",
  "com.twitter" % "scrooge-core_2.12" % "4.15.0" exclude("com.twitter", "libthrift"),
  "com.twitter" % "finagle-thrift_2.12" % "6.43.0" exclude("com.twitter", "libthrift"),
  "ch.qos.logback" % "logback-classic" % "1.1.7"
)
