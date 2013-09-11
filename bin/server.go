package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

type verboseHandler struct {
	fileHandler http.Handler
	verbose     bool
}

func (h *verboseHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if h.verbose {
		log.Printf("%s: %s\n", r.Method, r.URL.String())
	}
	h.fileHandler.ServeHTTP(w, r)
}

func getServer(cwd string, verbose bool) http.Handler {
	fileHandler := http.FileServer(http.Dir(cwd))
	return &verboseHandler{fileHandler, verbose}
}

func main() {
	ip := flag.String("h", "localhost", "Ip to bind to")
	port := flag.String("p", "8080", "Port to serve from")
	verbose := flag.Bool("v", false, "Verbose output")

	flag.Parse()

	cwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}

	location := fmt.Sprintf("%s:%s", *ip, *port)
	if *verbose {
		log.Printf("Serving files from %s on port %s\n", cwd, location)
	}

	server := getServer(cwd, *verbose)
	if err = http.ListenAndServe(location, server); err != nil {
		panic(err)
	}
}
