package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", Index)
	http.ListenAndServe(":8080", nil)
}

// Index handles a request on the root path
func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Welcome on my minimal docker app")
}
