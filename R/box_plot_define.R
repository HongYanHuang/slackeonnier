#' Define outlier by quantile
#'
#' @param boxplot_list list, generate with boxplot()
#' @param number, numeric
#' @examples
#' \dontrun{
#'     quantile_list <- boxplot(orders$count)
#'     box_plot_define(quantile_list, 38)
#'     // will return c('normal', '#31a7ff')
#' }
#' @return list with status and color
box_plot_define <- function(boxplot_list, number) {
  if(length(boxplot_list) != 5) {stop("must be a box plot list with 5 numberic vectors.")}
  if(length(number) > 1) {stop("number must be a vector of length one")}
  if(!is.numeric(number)) {stop("number must be a numeric vector")}

  if (number < boxplot_list[1]) {
    status = "⚠️*over low*⚠️"
    color = "#ff0000"
  }else if (number <= boxplot_list[2]) {
    status = "low"
    color = "#fbb034"
  }else if (number <= boxplot_list[4]) {
    status = "normal"
    color = "#31a7ff"
  }else if (number <= boxplot_list[5]) {
    status = "high"
    color = "#7ac143"
  }else {
    status = "⚠️*over high*⚠️"
    color = "#ffd900"
  }
  return(c(status, color))
}

#box_plot_define <- function(boxplot_list, number) {
#  color_status_config <- fromJSON(txt = Sys.getenv("STATUS_CONFIG"))
#  if (number < boxplot_list[1]) {
#    return(color_status_config$over_low)
#  }else if (number <= boxplot_list[2]) {
#    return(color_status_config$low)
#  }else if (number <= boxplot_list[4]) {
#    return(color_status_config$normal)
#  }else if (number <= boxplot_list[5]) {
#    return(color_status_config$high)
#  }else {
#    return(color_status_config$over_high)
#  }
#}
