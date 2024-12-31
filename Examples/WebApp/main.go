package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
)

var (
	workDirectory = func() string {
		execPath, err := os.Executable()
		if err != nil {
			log.Fatal(err)
		}
		return filepath.Dir(execPath)
	}()
	port = "3000"
)

func main() {
	flag.StringVar(&port, "port", port, "Port to serve on")
	flag.StringVar(&workDirectory, "dir", workDirectory, "Working directory")
	flag.Parse()

	http.Handle("/", http.FileServer(http.Dir(filepath.Join(workDirectory, "./src"))))
	log.Printf("Serving on http://localhost:%s\n", port)
	log.Printf("Working directory: %s\n", workDirectory)

	log.Fatal(http.ListenAndServe(fmt.Sprintf("0.0.0.0:%s", port), nil))
}
