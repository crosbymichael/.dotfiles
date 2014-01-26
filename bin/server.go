package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

type verboseHandler struct {
	h http.Handler
}

func NewVerboseHandler(h http.Handler) http.Handler {
	return &verboseHandler{h}
}

func (h *verboseHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	log.Printf("%s: %s\n", r.Method, r.URL.String())
	h.h.ServeHTTP(w, r)
}

func getServer(cwd string, verbose bool) http.Handler {
	h := http.FileServer(http.Dir(cwd))
	if verbose {
		h = NewVerboseHandler(h)
	}
	return h
}

func main() {
	cwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}

	ip := flag.String("h", "localhost", "Ip to bind to")
	port := flag.String("p", "8080", "Port to serve from")
	verbose := flag.Bool("v", false, "Verbose output")
	dir := flag.String("dir", cwd, "Folder to serve static files from")

	flag.Parse()

	location := fmt.Sprintf("%s:%s", *ip, *port)
	log.Printf("Serving files from %s at %s\n", *dir, location)

	server := getServer(*dir, *verbose)
	if err = http.ListenAndServe(location, server); err != nil {
		panic(err)
	}
}
