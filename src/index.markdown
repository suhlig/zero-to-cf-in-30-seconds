% Zero to CF in Kube-Cluster in 30 Seconds
% Akshay Mankar, Steffen Uhlig

# Who we are

- Akshay Mankar
  * Pivotal
  * `#eirini`, `#haskell`, previously `#cfcr`

- Steffen Uhlig
  * IBM
  * `#eirini`, `#ruby`, previously `#bits-service`

# 30 Seconds to CF?

>* We cheated a bit
>* 30 seconds is for typing `set-pipeline`
>* It's more like **15 minutes**

. . .

Sorry 🤠

# This is for you if:

You are ...

* Test-driving CF (different versions maybe?)
* Building on top of CF (e.g. a tool)
* Developing a CF component

# Big Idea

`minikube : kube = this : CF`

# Why?

# Dev speed

- quickly spin up a dev environment
- fast onboarding of new team members
- less fear
  => broke it? N.P.!

# It's lightweight

* Keep your laptop clean
  - no need to run CF locally
  - your version / patch level on someone else's hardware

* Cookie-cutter approach
  - Test environments by the dozen
  - Pets vs. cattle

# Repeatable

* Yields repeatable dev environments
* Ship the description, not the cluster
  - Vagrant philosophy

# Demo

`<video/>`

# How does it work?

* SCF + fissile
* Eirini
* Helm
* Concourse

# It's a pipeline!

![](pipeline-sketch.jpg)

# Details

# `set-pipeline`

* the only manual step
* takes the name of "the world"

# Creates k8s cluster

![](pipeline-cluster-management.png)

# Deploys SCF

![](pipeline-deploy-scf.png)

# It's ready!

![](welcome-to-scf.png)

# How to ...

# Help, I broke my dev env

Before:

* Debug
* Troubleshoot
* Give up
* Find the docs how to re-create

Now:

* Press the recreate button in Concourse

# New SCF release

Before: ...

Now: ...

# Ideas

* Notification?
* Print details at the end of set-pipeline?
* Your ideas?

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
