package main

import (
	"log"
	"net/http"
	"os"
	"path/filepath"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	path := r.URL.Path
	if path != "/" {
		http.NotFound(w, r)
		return
	}

	static_files := os.Getenv("STATIC_FILES")
	http.ServeFile(w, r, filepath.Join(static_files, "index.html"))
}

func main() {
	addr := os.Getenv("BIND_ADDR")
	if addr == "" {
		log.Fatal("BIND_ADDR is not set")
	}

	static_files := os.Getenv("STATIC_FILES")
	if static_files == "" {
		log.Fatal("STATIC_FILES directory is not set")
	}

	log.Printf("Listening on %s\n", addr)
	http.HandleFunc("/", indexHandler)
	log.Fatal(http.ListenAndServe(addr, nil))
}
