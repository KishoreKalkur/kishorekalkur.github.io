# Environment Configuration Guide

This project uses environment variables to manage different configurations for development and production environments.

## How Hugo Uses Environment Variables

Hugo automatically reads environment variables that follow the pattern `HUGO_<UPPERCASED_PARAM_NAME>`. These override values in `hugo.toml`:

- `HUGO_BASEURL` overrides `baseURL`
- `HUGO_TITLE` overrides `title`
- `HUGO_PARAMS_<KEY>` overrides `params.<key>`

For example, `HUGO_PARAMS_STYLE_PRIMARY` would override `params.style.primary` in the config.

## Quick Start

### Development Server

```bash
# Method 1: Use the startup script (recommended)
./start-dev.sh

# Method 2: Use custom environment variables
HUGO_BASEURL="http://localhost:8080/" ./start-dev.sh

# Method 3: Create and source a config file
cp env.config.example env.config
# Edit env.config as needed
source env.config
./start-dev.sh
```

### Production Build

```bash
# Build for production
./build-prod.sh

# Build with custom production URL
HUGO_BASEURL="https://custom-domain.com/" ./build-prod.sh
```

## Environment Variables

| Variable       | Description                          | Default                                                       |
| -------------- | ------------------------------------ | ------------------------------------------------------------- |
| `HUGO_BASEURL` | Base URL for the site                | `http://localhost:1313/` (dev) / `https://bas.org.in/` (prod) |
| `HUGO_PORT`    | Port for development server          | `1313`                                                        |
| `HUGO_BIND`    | Bind address for server              | `127.0.0.1`                                                   |
| `HUGO_ENV`     | Environment (development/production) | `development`                                                 |

## Scripts

### `start-dev.sh`

Starts the Hugo development server with live reload. Accepts environment variables for customization.

### `build-prod.sh`

Builds the site for production with minification and the production base URL.

### `env.config.example`

Example configuration file. Copy to `env.config` and customize for your environment.

## Usage Examples

### Local Network Testing

```bash
# Make site accessible on local network
HUGO_BASEURL="http://192.168.1.100:1313/" HUGO_BIND="0.0.0.0" ./start-dev.sh
```

### Different Port

```bash
# Use port 8080 instead of 1313
HUGO_PORT="8080" HUGO_BASEURL="http://localhost:8080/" ./start-dev.sh
```

### Staging Environment

```bash
# Build for staging
HUGO_BASEURL="https://staging.bas.org.in/" ./build-prod.sh
```

## Notes

- The `env.config` file is gitignored to prevent accidental commits of local configurations
- Environment variables override the values in `hugo.toml`
- Always use the production URL in `hugo.toml` as the default
