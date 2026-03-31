# Mailpit

Mailpit is an email testing tool that mimics an SMTP server for local use. It replaces Mailhog with a modern UI and active development.

## Installing Mailpit

1. Download and install Mailpit using the official install script

   ```sh
   sudo bash < <(curl -sL https://raw.githubusercontent.com/axllent/mailpit/develop/install.sh)
   ```

   This installs the binary to `/usr/local/bin/mailpit`.

1. Create a new service for `systemd`

   ```sh
   sudo vim /etc/systemd/system/mailpit.service
   ```

1. Paste the following in `mailpit.service`

   ```
   [Unit]
   Description=Mailpit Service
   After=network.target

   [Service]
   ExecStart=/usr/local/bin/mailpit
   Restart=always
   User=root
   Group=root
   Environment=PATH=/usr/local/bin:/usr/bin:/bin
   Environment=MP_SMTP_BIND_ADDR=127.0.0.1:1025
   Environment=MP_UI_BIND_ADDR=127.0.0.1:8025

   [Install]
   WantedBy=multi-user.target
   ```

1. Reload `systemd` and enable the service

   ```sh
   sudo systemctl daemon-reload &&
   sudo systemctl enable mailpit &&
   sudo systemctl start mailpit
   ```

1. Use `systemctl` to start / stop / check status of `mailpit`. The web UI is available at `http://localhost:8025` and the SMTP server listens on port `1025`.
