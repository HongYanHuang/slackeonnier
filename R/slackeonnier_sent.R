slackeonnier_sent <- function(attachment,
                          webhook = Sys.getenv("SLACK_INCOMING_WEBHOOK_URL"),
                          channel = Sys.getenv("SLACK_SENT_CHANNEL"),
                          username = Sys.getenv("SLACK_USERNAME")) {
  resp <- POST(url = webhook,
               encode = "form",
               add_headers(`Content-Type` = "application/x-www-form-urlencoded",
                           Accept = "*/*"),
               body = URLencode(sprintf("payload={\"channel\": \"%s\", \"username\": \"%s\", \"text\": \"%s\", \"attachments\": %s}",
                                                                     channel, username, " ", attachment)))

}
