---
title: Lagom Scala API release candidate
date: 2017-01-24
author_github: jroper
tags: news
summary: >
    The first release candidate of Lagom to include the new Scala API, Lagom 1.3.0-RC1, has been released.

---

We're happy to announce that Lagom 1.3.0-RC1 has been released!

This release candidate includes the new Lagom Scala API, fully documented and with feature parity with the Java API.

## Scala API design philosophy

In Lagom, we want both the Java API and the Scala API to be first class citizens, not one API built on the other, or one API augmented so that it works with the other language. For this reason, we have created two completely separate APIs, these APIs are provided by completely separate libraries, and typically will not be on the classpath at the same time. The namespaces selected for these APIs follow the convention introduced by Akka streams, namely that the Java API has a package name of `javadsl`, while the Scala API has a package name of `scaladsl`.

In general, when creating the Scala API, we have typically started with the Java API, and then worked from there to make it more idiomatic for Scala use. Some of the major differences from the Java API include:

* Compile time dependency injection. Lagom's Java API builds on Play's Guice support. Lagom's Scala API however uses a lightweight form of the cake pattern to wire dependencies together. This API is designed to work well with [Macwire](https://github.com/adamw/macwire), though Macwire is not required to use it.
* Stronger typed APIs where Scala allows, particularly in the persistent entity API.
* Use of type classes to provide serializers and path parameter extractors, rather than using reflection.
* Use of [play-json](https://playframework.com/documentation/2.5.x/ScalaJson) for JSON serialization support.
* Use of macros to implement service clients, rather than dynamic proxies.

## Other features

Other new features in this release include:

* JPA support, including JPA read side processor support.
* New test APIs for testing message broker integration.
* Activator is now deprecated, in favour of the new Giter8 support in sbt 0.13.13.

## Sample apps

The Lagom team has been working on an auction system that demonstrates many of the features of Lagom. You can get the Java version [here](https://github.com/lagom/online-auction-java) and the Scala version [here](https://github.com/lagom/online-auction-scala). Please be aware that these apps are still a work in progress.

## Migration

If you were using the Scala API in the M1 release of Lagom 1.3.0, there are some significant changes to the API that have occurred:

* Rework of Akka serializers, including removal of `Jsonable`, and programatic registration of the serializer registry rather than in the configuration file.  See [this pull request](https://github.com/lagom/lagom/pull/399) for a summary of changes.
* A major type bug has been fixed in persistent entities. As a result of the fix, `Persist` no longer has a type parameter, and `afterPersist` callbacks have been split into their own method parameter groups.
* `LagomDevModeComponents` has been moved to the `com.lightbend.lagom.scaladsl.devmode` package.
* Streamed service calls are now required to declare their `Source` message types to materialize to `NotUsed`, where before they were required to materialize to an unbound wildcard.
