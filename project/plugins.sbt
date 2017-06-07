logLevel := Level.Warn

resolvers += "sonatype" at "https://oss.sonatype.org/content/groups/public"
resolvers += "twitter-repo" at "http://maven.twttr.com"
resolvers += "scrooge-sbt-plugin" at "https://bintray.com"

addSbtPlugin("com.twitter" % "scrooge-sbt-plugin" % "4.15.0")
