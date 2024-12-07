app = "airin-project" # Replace with your desired Fly.io app name

# Build configuration
[build]
  image = "Dockerfile"

# Environment variables
[env]
  PORT = "3000" # Ensure this matches the EXPOSE value in your Dockerfile

# HTTP service configuration
[[services]]
  internal_port = 3000
  protocol = "tcp"

  # Routes HTTP and HTTPS traffic to your app
  [[services.ports]]
    handlers = ["http"]
    port = 80

  [[services.ports]]
    handlers = ["tls", "http"]
    port = 443

  # Health check configuration (optional, but recommended)
  [services.health_checks]
    path = "/healthz" # Update if you have a health check endpoint
    interval = "15s"
    timeout = "5s"

# Persistent storage (optional)
[mounts]
  source = "data"
  destination = "/data" # Adjust this path if your app requires persistent storage

[deploy]
  release_command = "npm run build && npm start" # Matches the build and start process
