# Outreachy - Round 14

Lightbend and Lagom are proud to be participating in [Outreachy](https://gnome.org/outreachy/), a program to help groups that are underrepresented in free and open source software get involved. For detailed information about Outreachy, including how to apply, see the [main program page](https://wiki.gnome.org/Outreachy).

This is the landing page for Outreachy Lagom projects.

Applications for Round 14 Lagom projects close on the 30th of March.

## Getting started

The best way to get started is to read Lagom's [Get Involved](../get-involved.html) page. From there you can find information about the project issue tracker and mailing lists, and links to instructions for building Lagom from source.

The best place to talk about Lagom development is on the [Lagom contributors Gitter channel](https://gitter.im/lagom/contributors). Discussion about the Lagom Outreachy projects can be had in the [Lagom Outreachy Gitter channel](https://gitter.im/lagom/outreachy), where Lagom Outreachy mentors can be found (though note that the Lagom team is very geographically distributed, including developers in Australia, USA and Europe, so don't expect to get immediate responses from any particular person).

To start contributing, there are several issues tagged with the "outreachy" label on the Lagom online auction sample app, see [here](https://github.com/lagom/online-auction-java/issues?q=is%3Aissue+is%3Aopen+label%3Aoutreachy). Alternatively, bugfixes and other changes to the main Lagom repo, or to any of the other sample apps in the Lagom GitHub organization, would be welcome.

## Projects

### Online Auction Sample app completion

Mentor: [James Roper](https://github.com/jroper)

[Online auction](https://github.com/lagom/online-auction-java) is a sample application for Lagom that demonstrates a broad range of Lagom's features and architectural practices. It is essentially an ebay clone, written with 5 services, an item service, a bidding service, a search service, a user service and a transaction service. The front-end of the system is a web application written in Java. The transaction service has yet to be implemented, while the user service is just a placeholder.  These services need to be implemented properly, demonstrating how to correctly use Lagom.

An understanding of programming in Java will help for this project, as will an understanding of reactive architectures. [Reactive Microservices Architecture](https://info.lightbend.com/COLL-20XX-Reactive-Microservices-Architecture-RES-LP.html) would be a good start to get a grounding in these concepts.
