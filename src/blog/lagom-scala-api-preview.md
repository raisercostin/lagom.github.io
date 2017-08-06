---
title: Introducing the Lagom Scala API
date: 2016-12-09
author_github: jroper
tags: news scala
summary: >
    The Lagom team are proud to announce the first milestone release of the
    Lagom Scala API, Lagom 1.3.0-M1! This release has been many months in the
    making, and we've cut this milestone as a preview release in the hope
    that we can get some early feedback before we cut the final release.
---

The Lagom team are proud to announce the first milestone release of the Lagom Scala API, Lagom 1.3.0-M1! This release has been many months in the making, and we've cut this milestone as a preview release in the hope that we can get some early feedback before we cut the final release.

## Design philosophy

In Lagom, we want both the Java API and the Scala API to be first class citizens, not one API built on the other, or one API augmented so that it works with the other language. For this reason, we have created two completely separate APIs, these APIs are provided by completely separate libraries, and typically will not be on the classpath at the same time. The namespaces selected for these APIs follow the convention introduced by Akka streams, namely that the Java API has a package name of `javadsl`, while the Scala API has a package name of `scaladsl`.

In general, when creating the Scala API, we have typically started with the Java API, and then worked from there to make it more idiomatic for Scala use. Some of the major differences from the Java API include:

* Compile time dependency injection. Lagom's Java API builds on Play's Guice support. Lagom's Scala API however uses a lightweight form of the cake pattern to wire dependencies together. This API is designed to work well with [Macwire](https://github.com/adamw/macwire), though Macwire is not required to use it.
* Stronger typed APIs where Scala allows, particularly in the persistent entity API.
* Use of type classes to provide serializers and path parameter extractors, rather than using reflection.
* Use of [play-json](https://playframework.com/documentation/2.5.x/ScalaJson) for JSON serialization support.
* Use of macros to implement service clients, rather than dynamic proxies.

## Status

The following APIs and features are complete:

* Service API
* Message broker API with Kafka implementation
* Persistence API with both Cassandra and JDBC implmentations
* Dev mode
* Play integration

Meanwhile, the following things are left to be done:

* ConductR integration
* Some testkit APIs
* Much of the documentation

To create a new Lagom Scala project, using sbt 0.13.13, run:

```
$ sbt new lagom/lagom-scala.g8
```

For a reasonably comprehensive demonstration of the Lagom Scala API, you can checkout the [online auction sample app](https://github.com/lagom/online-auction-scala). Note that this is a work in progress, some things aren't complete yet. Of course, the [documentation](/documentation/1.3.x/scala/Home.html) is also a good place to go.

As this is a milestone release, the API is still considered experimental, and will likely change before the final release. Hence, we recommend not using it for any production services yet.
