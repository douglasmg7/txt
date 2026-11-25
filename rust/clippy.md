# links
https://clippy.rust-lang.org/rust-1.100.0/index.html
https://doc.rust-lang.org/clippy/

# Clippy
To configure clippy-driver for a Rust 2024 edition project, pass --edition 2024 as a standard rustc flag on the command line and use a clippy.toml file for lint thresholds. Unlike cargo clippy, running clippy-driver directly bypasses Cargo, so it does not read Cargo.toml for edition settings or [lints] tables.

# Use cargo.toml with [lint] for:
cargo clippy

# Cargo.toml
[package]
name = "my_project"
edition = "2024"

[lints.clippy]
pedantic = { level = "warn", priority = -1 }
unwrap_used = "warn"

Workspace Inheritance. For multi-crate projects, define these rules under [workspace.lints.clippy] in the root manifest and add [lints] workspace = true to each member crate.

# Use clippy.toml for:
clippy-driver

# clippy.toml
msrv = "1.85.0" # Minimum Rust version supporting Edition 2024
too-many-arguments-threshold = 5
cognitive-complexity-threshold = 15
avoid-breaking-exported-api = false

# Usage
clippy-driver --edition 2024 -W clippy::all src/main.rs
clippy-driver --edition 2024 -W clippy::all -W clippy::pedantic src/main.rs

