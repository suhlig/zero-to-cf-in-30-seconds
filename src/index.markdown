% Zero to CF in Kube-Cluster in 30 Seconds
% Akshay Mankar, Steffen Uhlig

# Who we are

* Akshay Mankar
   - Pivotal
   - `#eirini`, `#haskell`, previously `#cfcr`

* Steffen Uhlig
   - IBM
   - `#eirini`, `#ruby`, previously `#bits-service`

# 30 Seconds to CF?

>* We cheated a bit
>* 30 seconds is for typing `set-pipeline`
>* It's more like **15 minutes**

. . .

Sorry 🤠

# This is for you if:

You are ...

* test-driving CF (different versions maybe?)
* building on top of CF (e.g. a tool)
* developing a CF component

# Big Idea

`minikube : kube :: this : CF`

# Demo

<video class="stretch" src="https://github.com/suhlig/zero-to-cf-in-30-seconds/releases/download/v1.0.0-beta.1/zero2cfin30s.mp4" controls />

<aside class="notes">
* Create the world
  ```command
  ./set-pipeline zero2cfin30s eirini ~/workspace/eirini/private-config
  ```
* In browser, show pipeline: https://ci.flintstone.cf.cloud.ibm.com/teams/eirini/pipelines/zero2cfin30s
* Trigger delete job:
  ```command
  fly -t eirini trigger-job --job zero2cfin30s/delete-cluster --watch
  ```
* In terminal, show CF containers coming up in `scf` namespace:
  ```command
  ibmcloud ks cluster-get zero2cfin30s
  eval $(ibmcloud ks cluster-config --cluster zero2cfin30s --export)
  watch kubectl get pods -n scf
  ```
* TODO Maybe show app containers coming up in `opi` namespace (classic HerrJulz demo)
</aside>

# Why?

# Dev speed

- Quickly spin up a dev environment
- Fast onboarding of new team members
- Less fear<br/>
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
* Ship the config, not the cluster
  - Vagrant philosophy

# How does it work?

* SCF + fissile
* Eirini
* Helm
* Concourse

# Secret Sauce

![](eirini-arch.png)

# It's a pipeline!


![](graph1.svg)
<!-- ![](pipeline-sketch.jpg) -->

# Deploy CF

![](graph2.svg)

# Test thy cluster

![](graph3.svg)

# No need to see the YAML

![](graph4.svg)

# Details


# Creates k8s cluster

![](pipeline-cluster-management.png)

# Deploys SCF

![](pipeline-deploy-scf.png)

# It's ready!

![](welcome-to-scf.png)

# `set-pipeline`

* the only manual step
* takes the name of "the world"

# How to ...

# Help!

## I broke my dev env

<div id="left">
* Before:
  - Debug
  - Troubleshoot
  - Give up
  - Find the docs how to re-create
</div>

<div id="right">
* Now:
  - Press the recreate button in Concourse
</div>

# Ideas

* Notification?
* Print details at the end of set-pipeline?
* Your ideas?

# Score Card

Did we achieve our goals? ...

1. Getting a new env is very straighforward: ✅
1. Repeatability: ✅
1. Speed == 30s: ❌
1. Speed <= 30mins: ✅

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
