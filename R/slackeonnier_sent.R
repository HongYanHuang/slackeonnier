#' Send attachment to Slack
#'
#' @param attachment json, comes from attachment_format()
#' @param webhook url, use slackeonnier_setup() to set up
#' @param channel string, use slackeonnier_setup() to set up
#' @param username string, use slackeonnier_setup() to set up
#' @example
#' \dontrun{
#'     slackeonnier_sent(my.attachment)
#' }
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
