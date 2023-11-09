package main

import (
	"fmt"
	"log"
	"os"
	"slices"
)

func main() {
	skip := []string{
		".git",
		".github",
		".gitignore",
		".terraform",
		"oldTerraform",
		"utils",
	}
	out := []string{}
	dirs, err := os.ReadDir("./")
	if err != nil {
		log.Panic(err)
	}
	for _, dir := range dirs {
		if slices.Contains(skip, dir.Name()) {
			continue
		}
		if dir.IsDir() {
			out = append(out, dir.Name())
			// fmt.Println(dir.Name())
		}

	}
	fmt.Println(out)
}
