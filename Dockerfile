# Use the latest 2.x builder
FROM caddy:2-builder AS builder

# Build with plugins
# github.com/hairyhenderson/caddy-teapot-module - 418 I'm a Teapot/Lights-on test
# github.com/caddy-dns/route53 - Update R53 DNS records for Let's Encrypt Challenge
# TODO github.com/porech/caddy-maxmind-geolocation - Support limiting origin IP addresses to US
RUN xcaddy build \
    --with github.com/caddy-dns/route53 \
    --with github.com/hairyhenderson/caddy-teapot-module
#    --with github.com/porech/caddy-maxmind-geolocation

# Overlay on the latest 2.x base image
FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy