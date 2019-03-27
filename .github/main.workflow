workflow "cf push on git push" {
  on = "push"
  resolves = "push to CF"
}

action "push to CF" {
  uses = "suhlig/gh-action-cf-push@master"
  needs = "generate-presentation"
  env = {
    API_ENDPOINT = "https://api.eu-gb.bluemix.net"
    CF_USER = "apikey"
    CF_ORG = "Steffen.Uhlig@de.ibm.com"
    CF_SPACE = "dev"
    EXTRA_ARGS = ""
  }
  secrets = ["CF_PASSWORD"]
}

action "generate-presentation" {
  uses = "docker://suhlig/webservices-ci"
  runs = ["sh", "-c", "bundle install && bundle exec rake"]
}
