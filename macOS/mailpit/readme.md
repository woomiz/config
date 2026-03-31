# Mailpit

Mailpit is an email testing tool that mimics an SMTP server for local use.

## Installing Mailpit

1. Install via Homebrew

   ```sh
   brew install mailpit
   ```

1. Start Mailpit as a background service (auto-starts on login)

   ```sh
   brew services start mailpit
   ```

   Or run it manually in the foreground

   ```sh
   mailpit
   ```

1. The web UI is available at `http://localhost:8025` and the SMTP server listens on port `1025`.

## Managing the Service

```sh
brew services start mailpit    # start and enable on login
brew services stop mailpit     # stop and disable on login
brew services restart mailpit  # restart
brew services info mailpit     # check status
```
