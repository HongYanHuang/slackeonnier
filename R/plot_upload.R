#' Post ggPlot to slack channel and return private URL
#'
#' @param plot ggplot object, default last plot
#' @param file prefix of your plot, default ggplot
#' @param dpi default 300
#' @param scale default 1
#' @param slack_api_token file:upload token, or setup with slackeonnier_setup()
#' @param upload_channel_name string, default #general
#' @return private url on slack
#' @examples
#' plot_upload(my.plot)
#' @export
plot_upload <- function(plot = ggplot2::last_plot(),
                       file = "ggplot",
                       dpi = 300,
                       scale = 1,
                       slack_api_token = Sys.getenv("SLACK_UPLOAD_API_TOKEN"),
                       upload_channel_name = Sys.getenv("SLACK_UPLOAD_IMAGE_CHANNEL")) {
  ftmp <- tempfile(file, fileext = ".png")
  ggplot2::ggsave(filename = ftmp,
         plot = plot,
         scale = scale,
         width = 16.2,
         height = 10,
         units = "cm",
         dpi = dpi,
         limitsize = TRUE)
  res <- httr::POST(url = "https://slack.com/api/files.upload",
              add_headers(`Content-Type`="multipart/form-data",
                          Accept = "*/*"),
              body = list(file = upload_file(ftmp),
                          token = slack_api_token,
                          channels = upload_channel_name)
  )
  url_schema <- httr::content(res)$file$url_private[1]
  return(url_schema)
}
