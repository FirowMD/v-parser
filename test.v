module main

struct Unst {
	x int
	y int
}

union Unun {
	st Unst
	x int
}

fn foo(mut n &int) int {
    unsafe {
        *n += 1
    }
    return *n
}

fn main() {
	mut a := 10
	b := 2
	c := b ^ a

	if a == 10 && b == 2 {
		println("c: ${c}")
	}
	println("Result: ${foo(mut &a)} : ${a}")
}