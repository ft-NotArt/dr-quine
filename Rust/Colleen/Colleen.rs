fn func() {
	let str: &str = "fn func() {{{0}	let str: &str = {1}{3}{1};{0}	print!({1}{3}{1}, '{2}n', '{1}', '{2}{2}', str);{0}}}{0}// A comment{0}fn main() {{{0}	// A cool comment{0}	func();{0}}}";
	print!("fn func() {{{0}	let str: &str = {1}{3}{1};{0}	print!({1}{3}{1}, '{2}n', '{1}', '{2}{2}', str);{0}}}{0}// A comment{0}fn main() {{{0}	// A cool comment{0}	func();{0}}}", '\n', '"', '\\', str);
}
// A comment
fn main() {
	// A cool comment
	func();
}