library(ggplot)
library(readr)
library(slackeonnier)

## load test data
orders <- read_csv(file = "./data/test_orders.csv")

## setup slackeonnier
slackeonnier_setup(upload_api_token = "your slack upload token",
                   upload_image_channel = "#your-storage-channel",
                   incoming_webhook_url = "your incoming webhook",
                   sent_channel = "#general",
                   username = " ")

## box_plot_define(boxplot, sample) can be change to any other methods you'd like to.
## just a simple example
order_status <- box_plot_define(boxplot(orders$orders)$stats, orders[nrow(orders),]$orders)

## prepare text sent to slack, can be change to any other you'd like to.
today_text <- strftime(today() - 1, format = "%m/%d")
order_info <- paste(today_text, "orders:", orders[nrow(orders),]$orders, "  status:", order_status[1])

## draw a plot using ggplot, can be skipped
order.plot <- ggplot(data = orders, aes(x = date, y = orders, group = 1)) +
  geom_line(size = 0.6, color = "#2AC400") +
  geom_point(data = orders[nrow(orders),], aes(x = date, y = orders), color = "#ff0000") +
  geom_text(data = orders[nrow(orders),], aes(x = date, y = orders, label = comma(orders)), color = "#ff0000", vjust = -0.4, size = 5) +
  scale_x_date(date_breaks = "1 week", date_labels = "%m-%d (Mon)") +
  xlab("") +
  ylab("Orders") +
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0,1),
        legend.justification = c(0, 0),
        legend.direction = "horizontal") +
  theme(panel.grid.minor.x = element_blank())

## upload your plot, can be skipped.
plot_url <- plot_upload(plot = order.plot)

## formating previous resources
atc <- attachment_format(former_text = order_info,
                  status_color = order_status[2],
                  image_url = plot_url)

## sent by slackeonnier
slackeonnier_sent(atc)
