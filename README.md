
![Feature](./data/slackeonnier_feature.png)
# Slackeonnier
Slackeonnier helps you sent warning notification with plot to Slack by :dove:.
  

  
![Demo](./data/demo.png)
## Feature
:rainbow: **Color management for different status**  
:canoe: Super light, easy setup  
:man_technologist: Made for data people, set your notification by yourself without dealing with http authenticate.  
:ng_man: **KEEP YOUR BOSS CALM FROM ASKING REDUNDENT QUESTIONS**    
  
  
## How do this library work?
please check out [my article](https://medium.com/@henry48124/build-data-alert-notification-on-slack-for-your-start-up-37db460fe812).

## Installation
```R
# Depeche mode
devtools::install_github("HongYanHuang/slackeonnier")

# Classic - uploading
# install.packages("slackeonnier")
```

## Quick Start
### 1. Load library and setup
```R
# load library
library(slackeonnier)

## setup slackeonnier
slackeonnier_setup(upload_api_token = "your slack upload token",
                   upload_image_channel = "#your-storage-channel",
                   incoming_webhook_url = "your incoming webhook",
                   sent_channel = "#general",
                   username = " ")
```
### 2. Prepare your text, color, plot(optional)
```R
## upload your plot, will return a private slack-url for attach
plot_url <- plot_upload(plot = your.plot)

## formating text, color, plot
atc <- attachment_format(former_text = your_text,
                  status_color = color_hex,
                  image_url = plot_url)
```
### 3. High five, bird fly, you smile!
```R
## sent by slackeonnier
slackeonnier_sent(atc)
```

or you can run [my example](./quick_start.R)