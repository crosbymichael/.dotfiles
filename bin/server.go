package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

//Type to wrap the default file handler to log requests
type logFileServer struct {
	fileHandler http.Handler
}

func (h *logFileServer) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	log.Printf("%s: %s\n", r.Method, r.URL.String())

	h.fileHandler.ServeHTTP(w, r)
}

func getServer(cwd string) http.Handler {
	fileHandler := http.FileServer(http.Dir(cwd))

	return &logFileServer{fileHandler}
}

func main() {
	port := flag.String("p", "8080", "Port to serve from.")
	flag.Parse()

	cwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}

	location := fmt.Sprintf(":%s", *port)
	fmt.Printf("Serving files from %s on port %s\n", cwd, location)

	server := getServer(cwd)
	if err = http.ListenAndServe(location, server); err != nil {
		panic(err)
	}
}
