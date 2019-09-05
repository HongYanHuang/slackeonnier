## attach your file as json
attachment_format <- function(former_text,
                              status_color,
                              image_url = NULL,
                              image_title = " ") {
  if(is.null(image_url)) {
    attachment <- jsonlite::toJSON(
      data.frame(text = former_text,
                 color = status_color,
                 mrkdwn_in = "text"))
  } else {
    attachment <- jsonlite::toJSON(
      data.frame(fallback = "ABC",
                 text = former_text,
                 color = status_color,
                 image_url,
                 mrkdwn_in = "text"))
  }
}
