#' Setup your api token, incoming webhook, channels
#'
#' @param upload_api_token file:upload token
#' @param upload_image_channel alternative channel for uploading plot, default #random
#' @param incoming_webhook_url incoming webhook for posting notification
#' @param sent_channel will post notification to this channel, default #general
#' @param username name of slack App, default slackeonnier
#' @examples
#' \dontrun{
#' slackeonnier()
#' }
#' @export

slackeonnier_setup <- function(upload_api_token = "",
                               upload_image_channel = "#random",
                               incoming_webhook_url = "",
                               sent_channel = "#general",
                               username = "slackeonnier") {
  Sys.setenv(SLACK_UPLOAD_API_TOKEN = upload_api_token)
  Sys.setenv(SLACK_UPLOAD_IMAGE_CHANNEL = upload_image_channel)
  Sys.setenv(SLACK_INCOMING_WEBHOOK_URL = incoming_webhook_url)
  Sys.setenv(SLACK_SENT_CHANNEL = sent_channel)
  Sys.setenv(SLACK_USERNAME = username)
}
