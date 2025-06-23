# Bangalore Astronomical Society Website

This is the official website for the Bangalore Astronomical Society (BAS), built using Hugo static site generator with the Hinode theme.

## 🚀 Quick Start

### Prerequisites

1. **Hugo Extended** (v0.142.0 or higher) - **Required**
   - macOS: `brew install hugo`
   - Windows: Download from [Hugo releases](https://github.com/gohugoio/hugo/releases)
   - Linux: `snap install hugo --channel=extended`
2. **Git** - **Required**

   - [Download Git](https://git-scm.com/)

3. **Go** (v1.19 or higher) - **Required for Hugo modules**
   - [Download Go](https://golang.org/dl/)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/bas-org/bas-website-clone.git
cd bas-website-clone
```

2. Run the setup script (recommended):

```bash
./setup.sh
```

This will:

- Check all prerequisites
- Install Hugo modules
- Set up environment configuration
- Make scripts executable
- Create required directories

3. Start the development server:

```bash
# Using the startup script (recommended)
./start-dev.sh

# Or with custom environment
HUGO_BASEURL="http://localhost:8080/" ./start-dev.sh
```

The website will be available at `http://localhost:1313/` (or your custom port)

### Manual Setup (if setup.sh fails)

```bash
# Install modules
hugo mod get -u
hugo mod tidy

# Make scripts executable
chmod +x start-dev.sh build-prod.sh setup.sh

# Copy environment config
cp env.config.example env.config

# Start server
./start-dev.sh
```

## 📁 Project Structure

```
bas-website-clone/
├── archetypes/          # Content templates
├── assets/              # SCSS, images, and other assets
│   ├── scss/           # Custom SCSS files
│   │   └── common/     # Variable overrides (_variables.scss, _variables-dark.scss)
│   └── img/            # Images
├── content/            # Website content (Markdown files)
│   ├── posts/          # Blog posts
│   ├── about/          # About page
│   ├── resources/      # Resources page
│   └── contact/        # Contact page
├── layouts/            # Custom layout overrides
├── static/             # Static files (CSS, JS, images)
│   └── img/            # Public images
├── public/             # Generated site (gitignored)
├── resources/          # Hugo cache (gitignored)
├── hugo.toml          # Hugo configuration
├── go.mod             # Go module configuration
├── go.sum             # Go module checksums
├── start-dev.sh       # Development server script
├── build-prod.sh      # Production build script
├── env.config.example # Environment configuration template
└── .gitignore         # Git ignore file
```

## 🔧 Environment Configuration

### Using Environment Variables

The project supports environment variables for flexible deployment:

```bash
# Development with custom settings
HUGO_BASEURL="http://192.168.1.100:1313/" HUGO_BIND="0.0.0.0" ./start-dev.sh

# Production build
./build-prod.sh

# Custom production URL
HUGO_BASEURL="https://staging.bas.org.in/" ./build-prod.sh
```

### Configuration Files

1. Copy the example config:

   ```bash
   cp env.config.example env.config
   ```

2. Edit `env.config` with your settings

3. Source and run:
   ```bash
   source env.config
   ./start-dev.sh
   ```

## 🎨 Customization

### Theme Colors

The website uses a custom color scheme with BAS blue (#0066cc) for links. Colors are defined in:

1. `assets/scss/common/_variables.scss` - Light mode colors
2. `assets/scss/common/_variables-dark.scss` - Dark mode colors
3. `hugo.toml` - Theme configuration

Current color scheme:

- Primary: `#2c5282`
- Links: `#0066cc` (BAS official blue)
- Link hover: `#0052a3`

### Content Management

- **Blog Posts**: Add new markdown files to `content/posts/`
- **Pages**: Edit existing pages in their respective directories under `content/`
- **Images**: Place images in `static/img/` for public access

## 🛠️ Development

### Running the Development Server

```bash
# Using the startup script (recommended)
./start-dev.sh

# Direct Hugo command
hugo server

# With live reload disabled
hugo server --disableFastRender

# Custom port and bind address
HUGO_PORT=8080 HUGO_BIND="0.0.0.0" ./start-dev.sh
```

### Building for Production

```bash
# Using the build script (recommended)
./build-prod.sh

# Direct Hugo command
hugo --minify

# With custom base URL
HUGO_BASEURL="https://custom.domain.com/" ./build-prod.sh
```

The built site will be in the `public/` directory.

### Deployment

For deployment to various platforms:

#### GitHub Pages

```bash
./build-prod.sh
# Push the public/ directory to gh-pages branch
```

#### Netlify

1. Connect your GitHub repository
2. Build command: `hugo --minify`
3. Publish directory: `public`
4. Environment variable: `HUGO_VERSION = 0.142.0`

#### Generic Server

```bash
./build-prod.sh
rsync -avz public/ user@server:/var/www/html/
```

## 📝 Content Guidelines

### Blog Post Format

Create a new blog post:

```bash
hugo new posts/my-new-post.md
```

Or manually create with frontmatter:

```markdown
---
title: "Your Post Title"
date: 2025-01-21
description: "Brief description for SEO"
categories: ["Events"] # Options: Events, Guides, Equipment, Photography
tags: ["astronomy", "telescope", "astrophotography"]
thumbnail:
  url: img/your-image.jpg
draft: false
---

Your content here...
```

### Adding Images

Use the `image` shortcode for standalone images:

```markdown
{{< image src="img/photo.jpg"
    caption="Your caption"
    ratio="16x9"
    class="img-fluid rounded shadow"
    wrapper="my-4" >}}
```

Available ratios: `1x1`, `3x2`, `4x3`, `16x9`, `21x9`

### Image Guidelines

- **Format**: Use JPEG for photos, PNG for graphics, WebP for optimization
- **Location**: Store in `static/img/` or organized subfolders
- **Naming**: Use descriptive names (e.g., `telescope-observation-2025.jpg`)
- **Size**: Optimize images before uploading (max 2MB recommended)
- **Dimensions**: 1920x1080 for hero images, 800x600 for content images

## 🚨 Troubleshooting

### Common Issues

1. **"command not found: hugo"**

   - Ensure Hugo Extended is installed: `hugo version`
   - Should show: `hugo v0.142.0+extended`

2. **Module errors**

   ```bash
   hugo mod get -u
   hugo mod tidy
   hugo mod clean
   ```

3. **SCSS compilation errors**

   ```bash
   # Clear cache and rebuild
   rm -rf resources/ public/
   hugo mod clean
   ./start-dev.sh
   ```

4. **Images not displaying**

   - Check file path: images should be in `static/img/`
   - Use correct shortcode: `{{< image >}}` not `{{< img >}}`
   - Verify file extensions are lowercase

5. **Permission denied on scripts**

   ```bash
   chmod +x start-dev.sh build-prod.sh
   ```

6. **Port already in use**
   ```bash
   # Use a different port
   HUGO_PORT=8080 ./start-dev.sh
   ```

### Verifying Installation

Run this checklist:

```bash
# Check Hugo version (should be extended)
hugo version

# Check Go installation
go version

# Verify modules
hugo mod graph

# Test build
hugo --gc --minify
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Contact

- Website: [https://bas.org.in](https://bas.org.in)
- Email: contact@bas.org.in
- Facebook: [Bangalore Astronomical Society](https://www.facebook.com/bas.org.in/)
- Instagram: [@bas.org.in](https://www.instagram.com/bas.org.in)
- X (Twitter): [@b_a_s](https://x.com/b_a_s)

## 🚀 Server Deployment Guide

### VPS/Cloud Server Setup

```bash
# 1. Install dependencies on server
sudo apt update
sudo apt install -y git golang-go

# Install Hugo Extended
wget https://github.com/gohugoio/hugo/releases/download/v0.142.0/hugo_extended_0.142.0_linux-amd64.deb
sudo dpkg -i hugo_extended_0.142.0_linux-amd64.deb

# 2. Clone and setup
git clone https://github.com/bas-org/bas-website-clone.git
cd bas-website-clone
./setup.sh

# 3. Build for production
HUGO_BASEURL="https://yourdomain.com/" ./build-prod.sh

# 4. Setup web server (nginx example)
sudo cp -r public/* /var/www/html/
```

### Docker Deployment

Create a `Dockerfile`:

```dockerfile
FROM klakegg/hugo:ext-alpine
COPY . /src
WORKDIR /src
RUN hugo mod get -u && hugo --minify
```

Build and run:

```bash
docker build -t bas-website .
docker run -p 8080:80 bas-website
```

### CI/CD Pipeline (GitHub Actions)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: "0.142.0"
          extended: true
      - run: hugo mod get -u
      - run: hugo --minify
      - name: Deploy
        # Add your deployment steps here
```

## 🙏 Acknowledgments

- Built with [Hugo](https://gohugo.io/)
- Theme: [Hinode](https://gethinode.com/)
- Hosted on [GitHub Pages](https://pages.github.com/)
