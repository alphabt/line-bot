# Line-Bot

This is a sample Line bot running on Ruby on Rails and integrates with [line-bot-api](https://github.com/line/line-bot-sdk-ruby "line-bot-api") gem.

## Demo
Use your Line app and add this Line bot as a friend with the following QR code. When you send it a message it will echo the same message back to you.

![alt text](https://qr-official.line.me/sid/L/iuz6052x.png)

## Setup
1. Sign up for a [Line Business Center account](https://business.line.me "Line Business Center") and create a Line bot account.
2. Clone this repo to your local
3. Create config/application.yml and add your own `line_channel_id`, `line_channel_secret`, `line_channel_mid` settings.
    - You can find your channel information at your [Line channel page](https://developers.line.me/channels)
    - Sample application.yml is at config/application_sample.yml.
4. Deploy to Heroku
5. Run `figaro heroku:set` to set your Line channel configs defined above in Heroku
6. Configure your [Line channel](https://developers.line.me/channels "Line channel") to add a callback URL. Ex. `https://<heroku-app-name>.herokuapp.com:443/callback`
