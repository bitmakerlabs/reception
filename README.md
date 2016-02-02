# Reception

Imagine you are visiting a brick'n'mortar office of some organization. Imagine that organization is Bitmaker. You go up the stairs to the second floor and you see an iPad mounted next to the entrance door. You fill out your name and select who you're there to see: Erik. You let the iPad snap a photo of yourself and hit Submit. Erik gets a notification on his phone and you are shortly reunited with Erik.

Reception is a Rails application for persisting visitor data and is a companion web service for the [Reception iOS App](https://github.com/bitmakerlabs/reception-react-native)

## _Help Wanted_

If you would like to get involved in development, check out the TODO at the bottom, fork the repo, create a branch, open a pull request.

## Slack integration

We are using the `slack-ruby-client` gem to communicate with the Slack Web API.

You need to get a Slack token at [https://api.slack.com/web](https://api.slack.com/web)

The Rails app expects the token to be available via the `SLACK_TOKEN` environment variable.

### Slack features

* The list of hosts is generated from the Slack organization corresponding to the
slack token. There's a rake task `rake slack:users` that downloads the list of slack users into the `hosts` table.
* When a visit is persisted, a slack message is sent to the `#reception` channel.

## AWS S3

Visitor photos are stored in AWS S3.

Get the public and secret key from AWS and make them available to the Rails app via the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.
The bucket name should be set in `S3_BUCKET_NAME`.

## TODO

* Add tests

## LICENSE and COPYRIGHT

Licensed under the BSD license. See more details at [LICENSE.txt](LICENSE.txt)
