workflow "cf push on git push" {
  on = "push"
  resolves = "push to CF"
}

action "push to CF" {
  uses = ".github/actions/cf-push"
  env = {
    API_ENDPOINT = "https://api.eu-gb.bluemix.net"
    CF_USER = "apikey"
    CF_ORG = "Steffen.Uhlig@de.ibm.com"
    CF_SPACE = "presentations"
    EXTRA_ARGS = ""
  }
  secrets = ["CF_PASSWORD"]
}
