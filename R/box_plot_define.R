box_plot_define <- function(boxplot_list, number) {
  if (number < boxplot_list[1]) {
    Sys.setenv("STATUS_OVER_LOW") %>>%
      return()
  }else if (number <= boxplot_list[2]) {
    Sys.setenv("STATUS_LOW") %>>%
      return()
  }else if (number <= boxplot_list[4]) {
    Sys.setenv("STATUS_NORMAL") %>>%
      return()
  }else if (number <= boxplot_list[5]) {
    Sys.setenv("STATUS_HIGH") %>>%
      return()
  }else {
    Sys.setenv("STATUS_OVER_HIGH") %>>%
      return()
  }
}
