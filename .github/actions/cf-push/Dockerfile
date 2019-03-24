FROM alpine
LABEL maintainer="Steffen Uhlig <Steffen.Uhlig@de.ibm.com>"

LABEL "com.github.actions.name"="cf push"
LABEL "com.github.actions.description"="Push the code to Cloud Foundry"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="blue"

# LABEL "repository"="https://github.com/suhlig/gh-action-cf-push"

RUN	apk add --no-cache \
	ca-certificates \
	curl \
  jq

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary" | tar -zx && mv cf /usr/local/bin

ADD cf-push /usr/local/bin/cf-push

ENTRYPOINT ["cf-push"]
