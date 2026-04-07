# Ident
Rust style is to indent with four spaces, not a tab.

# Macro
Calls a Rust macro. If it called a function instead, it would be entered as println (without the !).
println!

# Associated function
Is implemented on a type, in this case String, rather than on a particular instance of a String.
Some languages call this a static method.
String::new()

# Explain an error
rustc --explain E0061
https://doc.rust-lang.org/error_codes/error-index.html