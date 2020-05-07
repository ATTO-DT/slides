package main

import (
	"fmt"
	"time"
)

func double(in <-chan int, out chan<- int) {
	for {
		number := <-in
		dbl := 2 * number
		//secs := 100000 //rand.Intn(10)
		time.Sleep(10000)
		out <- dbl
	}
}

func main() {
	ch1 := make(chan int)
	ch2 := make(chan int)

	go double(ch1, ch2)
	numbers := []int{3, 7, 11, 8, 12, 4}
	for _, n := range numbers {
		ch1 <- n
		res := <-ch2
		fmt.Println(res)
	}
	close(ch1)
	fmt.Println("done")
}
