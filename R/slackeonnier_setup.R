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
