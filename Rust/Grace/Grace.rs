use std::fs;
// Comment
macro_rules! STR {
	() => {
		"use std::fs;{0}// Comment{0}macro_rules! STR {{{0}	() => {{{0}		{1}{3}{1}{0}	}};{0}}}{0}macro_rules! KID {{{0}	() => {{{0}		let str = format!(STR!(), '{2}n', '{1}', '{2}{2}', STR!());{0}		fs::write({1}Grace_kid.rs{1}, str)?{0}	}};{0}}}{0}macro_rules! MAIN {{{0}	() => {{{0}		fn main() -> std::io::Result<()> {{{0}			KID!();{0}			Ok(()){0}		}}{0}	}};{0}}}{0}MAIN!();"
	};
}
macro_rules! KID {
	() => {
		let str = format!(STR!(), '\n', '"', '\\', STR!());
		fs::write("Grace_kid.rs", str)?
	};
}
macro_rules! MAIN {
	() => {
		fn main() -> std::io::Result<()> {
			KID!();
			Ok(())
		}
	};
}
MAIN!();