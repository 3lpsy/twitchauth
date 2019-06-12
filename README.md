# Twitch Oauth

Generate Oauth Tokens

## Note

These tokens are short lived and require a browser to generate.

### Configuration

Ensure TWITCH_CLIENT_ID and TWITCH_CLIENT_SECRET are set appropriately.
```
$ export TWITCH_CLIENT_ID=""
$ export TWITCH_CLIENT_SECRET=""
```

Register App: [https://dev.twitch.tv/console/apps/create](https://dev.twitch.tv/console/apps/create)

Make sure to set the Redirect URL to "http://localhost:7001/redirect"

### Run (without building)
```
$ go run main.go
```
### Building

```
$ make deps
$ make build
```
