# Nginx Setup for andrasat.com

This folder contains repo-managed virtual host config for VPS deployment.

- Primary config file: `andrasat.com.conf`
- Purpose: serve `andrasat.com` through the Nuxt app (`127.0.0.1:3000`)

## Do we need to edit `default`?

Short answer: **not required**.

Best practice is to add this config as a separate site file and enable it beside `default`, then disable `default` after verification.

## Recommended VPS steps (Debian/Ubuntu)

> Important: `andrasat.com.conf` contains TLS blocks that reference
> `/etc/letsencrypt/live/andrasat.com/*`.
> Ensure this certificate path already exists before enabling the site file.

```bash
# 1) Copy repo config into sites-available
sudo cp /path/to/repo/configs/nginx/andrasat.com.conf /etc/nginx/sites-available/andrasat.com.conf

# 2) Enable site
sudo ln -s /etc/nginx/sites-available/andrasat.com.conf /etc/nginx/sites-enabled/andrasat.com.conf

# 3) Issue or renew primary-domain certificate
sudo certbot --nginx -d andrasat.com -d www.andrasat.com

# 4) Validate config
sudo nginx -t

# 5) Reload nginx
sudo systemctl reload nginx
```

### If this is the first certificate issuance

If `/etc/letsencrypt/live/andrasat.com/` does not exist yet:

1. Issue certificate first (HTTP challenge) using a temporary HTTP-only config, or standalone/webroot mode.
2. After cert exists, enable `andrasat.com.conf` and run `nginx -t && systemctl reload nginx`.

## Default site handling

You can keep `default` enabled temporarily during rollout.

After verifying primary domain works, disable `default` to avoid accidental catch-all routing:

```bash
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx
```

## Expected URLs after setup

- `https://andrasat.com/`
