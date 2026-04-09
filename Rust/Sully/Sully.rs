use std::fs;
use std::process::Command;
macro_rules! STR {
	() => {
		"use std::fs;{0}use std::process::Command;{0}macro_rules! STR {{{0}	() => {{{0}		{1}{3}{1}{0}	}};{0}}}{0}fn main() -> std::io::Result<()> {{{0}	let mut i = {4};{0}	if cfg!(child) {{{0}		i -= 1;{0}	}}{0}	if i < 0 {{{0}		return Ok(());{0}	}}{0}	let file_name = format!({1}Sully_{{0}}.rs{1}, i);{0}	let str = format!(STR!(), '{2}n', '{1}', '{2}{2}', STR!(), i);{0}	fs::write(file_name, str)?;{0}	let cmd = format!({1}rustc --cfg child -o Sully_{{0}} Sully_{{0}}.rs ; ./Sully_{{0}}{1}, i);{0}	Command::new({1}sh{1}).arg({1}-c{1}).arg(&cmd).status()?;{0}	return Ok(());{0}}}"
	};
}
fn main() -> std::io::Result<()> {
	let mut i = 5;
	if cfg!(child) {
		i -= 1;
	}
	if i < 0 {
		return Ok(());
	}
	let file_name = format!("Sully_{0}.rs", i);
	let str = format!(STR!(), '\n', '"', '\\', STR!(), i);
	fs::write(file_name, str)?;
	let cmd = format!("rustc --cfg child -o Sully_{0} Sully_{0}.rs ; ./Sully_{0}", i);
	Command::new("sh").arg("-c").arg(&cmd).status()?;
	return Ok(());
}