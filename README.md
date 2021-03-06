
![Demo](./data/og_demo.png)  
# Slackeonnier :dove: 
`Slackeonnier` - send data notifications with color and plot to Slack by :dove:.
  
## Features
#### :traffic_light: Customized Color Management
#### :bar_chart: Plot + Text + Color = DONE!

:no_bell: Mute redundant quetions from your boss
  
## Basic Idea

Complete ideation and implementation please check out [medium article](https://medium.com/@henry48124/hands-on-hack-built-your-own-data-notification-with-r-290e156b209c?source=friends_link&sk=a02412cfdd9855e8c3a099f1d549c1a3).

## Installation
```R
# Depeche mode
devtools::install_github("HongYanHuang/slackeonnier")

# Classic - coming soon
# install.packages("slackeonnier")
```

## Quick Start
### 1. Load library and setup
```R
# load library
library(slackeonnier)
```
```R
## setup slackeonnier
slackeonnier_setup(upload_api_token = "your slack upload token",
                   upload_image_channel = "#your-storage-channel",
                   incoming_webhook_url = "your incoming webhook",
                   sent_channel = "#general",
                   username = " ")
```
### 2. Plot + Text + Color = 
```R
## upload your plot, will return a private slack-url for attach
plot_url <- plot_upload(plot = your.plot)

## formating text, color, plot
atc <- attachment_format(former_text = your_text,
                  status_color = color_hex,
                  image_url = plot_url)
```
### 3. DONE :dove: 
```R
## sent by slackeonnier
slackeonnier_sent(atc)
```
  
## Example
run [example script](./quick_start.R)
  

## Main Functions
### slackeonnier_setup
Recommended in setting environment argument for slackeonnier; otherwise you must provide in every function needed.  

| Name | Format | Require | Description |  
| --- | --- | --- | --- |
| upload_api_token | string | Yes | file:upload token |  
| upload_image_channel | string | Yes | alternative channel for uploading plot, default #random |  
| incoming_webhook_url| string | Yes | incoming webhook for posting notification|  
| sent_channel| string | No | will post notification to this channel, default #general|  
| username| string | No | name of slack App, default slackeonnier |  
  
  
### plot_upload
Upload your ggplot object to slack and return a private url for upcoming attach in message.  
  
| Name | Format | Require | Description |  
| --- | --- | --- | --- |  
| plot | ggplot object | Yes | ggplot object to upload |  
| upload_api_token | string | Yes | use slackeonnier_setup() |  
| upload_image_channel | string | Yes | use slackeonnier_setup() |  
  
  
### attachment_format
Plot + Text + Color formatting as an attachment object.  

| Name | Format | Require | Description |  
| --- | --- | --- | --- |  
| former_text | string | Yes | text in message |  
| status_color | string | Yes | Hex code |  
| image_url | string | No | your url from plot_upload() |  
  
  
### slackeonnier_sent
sent attachment to slack channel
  
| Name | Format | Require | Description |  
| --- | --- | --- | --- |  
| attachment | json | Yes | text in message |  
| webhook | string | Yes | use slackeonnier_setup() |  
| channel | string | No | use slackeonnier_setup(), default #general |  
| username | string | No |  use slackeonnier_setup(), default slackeonnier |  
