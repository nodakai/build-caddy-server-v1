package main

import (
	"github.com/caddyserver/caddy/caddy/caddymain"
	// plug in plugins here
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
