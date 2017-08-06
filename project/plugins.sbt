addSbtPlugin("com.typesafe.sbt" % "sbt-twirl" % "1.1.1")
addSbtPlugin("com.typesafe.sbt" % "sbt-web" % "1.3.0")
addSbtPlugin("com.typesafe.sbt" % "sbt-js-engine" % "1.1.3")
addSbtPlugin("com.typesafe.sbt" % "sbt-stylus" % "1.0.3")
addSbtPlugin("net.ground5hark.sbt" % "sbt-concat" % "0.1.8")
addSbtPlugin("com.typesafe.sbt" % "sbt-uglify" % "1.0.3")
addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "3.0.0")

resolvers += "Typesafe Releases Repository" at "http://repo.typesafe.com/typesafe/releases/"

// Used for our SimpleHTTPServer in Akka HTTP
libraryDependencies += "com.typesafe.akka" % "akka-http-experimental_2.10" % "2.0.4"
