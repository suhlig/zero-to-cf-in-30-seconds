# [Zero to CF in Kube-Cluster in 30 Seconds with Concourse, Helm, Fissile and Eirini](https://cfna19.sched.com/event/LVYz/zero-to-cf-in-kube-cluster-in-30-seconds-with-concourse-helm-fissile-and-eirini-steffen-uhlig-ibm-akshay-mankar-pivotal)

Steffen Uhlig, IBM & Akshay Mankar, Pivotal

Track: Cloud Foundry for Business
Experience Level: Beginner

Thursday, April 4 • 3:40pm - 4:10pm

# Abstract

Creating a new Cloud Foundry instance has never been easier. With the advent of Fissile and Project Eirini, deploying a new CF has become a matter of invoking a few scripts, fired from a command line.

The Eirini team took this even further with a 1-click approach. In this talk, we will share how we, with the press of a button, create a new Concourse pipeline that creates a new Kubernetes cluster, deploys Cloud Foundry to it, runs CATs, and hands it over to the requester.

We will present an approach to CI/CD that yields standardized development environments resulting in a shorter time to first deploy, with less confusion where to find important information about your environments. With our 1-click pipeline, your kube cluster with CF is not a pet anymore - if in doubt, you can kill and re-create it in seconds.

# High-level Story

* Audience
  - Architects
  - Operators
  - CF Developers
  - Developing on top of CF
  - NOT: application developers that just deploy to CF
* Why would you want to do this?
  - You are developing a CF component
  - You are developing on top of CF, e.g. a tool
  - Test-drive
* "The minikube-equivalent for CF"
* Key thing to win: consistency
  - cookie-cutter approach to creating test environments
  - vagrant philosophy - repeatable dev envs

* Where do we start?
  1. start with the end result and go back
  1. or: build it up

## Start with the end result

Movie: In a terminal, someone types

    `set-pipeline foobar`

- wait a few minutes (fast forward)
- come back after 15 minutes and see your CF deployed on k8s
- look at the output of the last task and see all the important info:
    ```
    Welcome to your new deployment of SCF.

    The endpoint for use by the `cf` client is
        https://api.158.176.93.34.nip.io

    To target this endpoint run
        cf api --skip-ssl-validation https://api.158.176.93.34.nip.io

    Please remember, it may take some time for everything to come online.

    You can use
        kubectl get pods --namespace scf
  ```      
- in the video, show pods getting created just like the general Eirini demo
- all config under version control
- did not provide any custom values beyond `foobar`
- save myvalues as state in git

## Why did _we_ do this?

* easy setup of a new, rather complex pipeline
* large team, do not step on each other's toes
* pets vs. cattle
* speed
* "feature branch" pipelines
* quick onboarding of new team members
* change stuff once, apply "everywhere"

# TODO
* master gets cf-pushed to a staging space
* releases gets cf-pushed to the production space

# Feedback
* Took around 20 minutes in total
* We should provide more details about what _exactly_ happens in our pipeline (not just "there is a magic pipeline").
* Some in the audience did not know much about SCF and Eirini yet, maybe we can add some details about those upfront
* Mention more prominently that this is `ibmcloud`-only so far
