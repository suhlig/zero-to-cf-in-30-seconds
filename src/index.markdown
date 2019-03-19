% Zero to CF in Kube-Cluster in 30 Seconds
% Akshay Mankar, Steffen Uhlig

# Who we are

- Akshay Mankar
  * Pivotal
  * `#eirini`, previously `#cfcr`

- Steffen Uhlig
  * IBM
  * `#eirini`, `#ruby`, previously `#bits-service`

# 30 Seconds to CF?

* `set-pipeline` may take 30 seconds, but...

. . .

* It's more like 15 minutes from `0` to CF

Sorry 🤠

# This is for you if:

You are ...

* developing a CF component
* developing on top of CF, e.g. a tool
* test-driving CF (different versions maybe?)

# Big Idea

`minikube : kube = this : CF`

# Why?

* Dev speed
  - quickly spin up a dev environment
  - fast onboarding of new team members
  - less fear
    => broke it? N.P.!

* Keep your laptop lightweight
  - no need to run CF locally
  - your version / patch level on someone else's hardware

* Cookie-cutter approach
  - Test environments by the dozen
  - Pet vs. cattle

* Vagrant philosophy
  - Repeatable dev environments
  - Ship the description, not the cluster

# Demo

`<video/>`

# How does it work?

![](pipeline-sketch.jpg)

# Score Card

Did we achieve our goals?

1.
1.
1.

# Thanks!

`@AkshayMankar`

`@suhlig`

<div class="mini">
  Rev.
  #include ../gpp/.dirty

  <br/>
  built on
  #exec TZ=UTC date +"%Y-%m-%d %T %Z"
 </div>
