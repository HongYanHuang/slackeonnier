status_color_setup <- function(over_low = c("⚠️*Over Low*⚠️", "#ff0000"),
                               low = c("Low", "#fbb034"),
                               normal = c("Normal", "#31a7ff"),
                               high = c("high", "#7ac143"),
                               over_high =  c("⚠️*over high*⚠️", "#ffd900")) {
  Sys.setenv(STATUS_OVER_LOW = over_low)
  Sys.setenv(STATUS_LOW = low)
  Sys.setenv(STATUS_NORMAL = normal)
  Sys.setenv(STATUS_HIGH = high)
  Sys.setenv(STATUS_OVER_HIGH = over_high)
}
