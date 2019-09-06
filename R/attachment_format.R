#' Pack Plot, Text, and Color to attachment format
#'
#' @param former_text your text on attachment
#' @param status_color hex
#' @param image_url (optional) your plot url, must be https
#' @param image_title (optional) text
#' @return json file to attach
#' @examples
#' attachment_format('Order Status: Over High', '#FF0000', 'https://image.url', '20190901_Order')
#' @export
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
