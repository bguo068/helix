## Changes from Upstream

This fork adds commands and keybindings for sending code directly from Helix to a terminal pane (WezTerm, tmux, or Zellij).

## Build and Install

```sh
#!/usr/bin/env bash

# Clone the repo
git clone https://github.com/bguo068/helix.git
cd helix

# Build
cargo build --profile opt \
  --config 'build.rustflags="-C target-cpu=native"' \
  --bin hx \
  --locked

# Package only the files needed for distribution
mkdir -p pkg
rsync -a target/opt/hx pkg/
rsync -a --exclude='runtime/grammars/sources' runtime pkg/
```

To install:

- mv `pkg/hx` to a directory in your `$PATH`
- mv `pkg/runtime` under `~/.config/helix/`

## Usage

### Configure a Target Terminal

Set `send-target` either in `config.toml` or at runtime with a Helix command.

#### Option 1: `config.toml`

```toml
[editor]

# WezTerm
send-target = "wezterm 6" # Pane ID 6
# Find the current pane ID with: echo $WEZTERM_PANE

## tmux
# send-target = "tmux :0.1"
## Sends to window 0, pane 1 of the current session

## Zellij
# send-target = "zellij right"
## Direction relative to the current pane:
## left | right | up | down
```

#### Option 2: Helix Command

```text
:set-option send-target wezterm 6
```

### Send Code

| Action | Key |
|---------|------|
| Send current line (no selection) | `\\` |
| Send selected text | `\\` |
| Send current code block | `\c` |

### Code Blocks

`\c` sends the current block to the target terminal.

Block boundaries are defined by lines beginning with:

```text
# %%
```

Example:

```python
# %%
x = 1
y = 2

# %%
print(x + y)
```

With the cursor inside either section, `\c` sends only that block.

## Python Notes

For Python workflows, use **IPython** instead of the standard Python REPL. IPython supports bracketed paste mode, which allows multi-line code to be sent correctly.


<div align="center">

<h1>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="logo_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="logo_light.svg">
  <img alt="Helix" height="128" src="logo_light.svg">
</picture>
</h1>

[![Build status](https://github.com/helix-editor/helix/actions/workflows/build.yml/badge.svg)](https://github.com/helix-editor/helix/actions)
[![GitHub Release](https://img.shields.io/github/v/release/helix-editor/helix)](https://github.com/helix-editor/helix/releases/latest)
[![Documentation](https://shields.io/badge/-documentation-452859)](https://docs.helix-editor.com/)
[![GitHub contributors](https://img.shields.io/github/contributors/helix-editor/helix)](https://github.com/helix-editor/helix/graphs/contributors)
[![Matrix Space](https://img.shields.io/matrix/helix-community:matrix.org)](https://matrix.to/#/#helix-community:matrix.org)

</div>

![Screenshot](./screenshot.png)

A [Kakoune](https://github.com/mawww/kakoune) / [Neovim](https://github.com/neovim/neovim) inspired editor, written in Rust.

The editing model is very heavily based on Kakoune; during development I found
myself agreeing with most of Kakoune's design decisions.

For more information, see the [website](https://helix-editor.com) or
[documentation](https://docs.helix-editor.com/).

All shortcuts/keymaps can be found [in the documentation on the website](https://docs.helix-editor.com/keymap.html).

[Troubleshooting](https://github.com/helix-editor/helix/wiki/Troubleshooting)

# Features

- Vim-like modal editing
- Multiple selections
- Built-in language server support
- Smart, incremental syntax highlighting and code editing via tree-sitter

Although it's primarily a terminal-based editor, I am interested in exploring
a custom renderer (similar to Emacs) using wgpu.

Note: Only certain languages have indentation definitions at the moment. Check
`runtime/queries/<lang>/` for `indents.scm`.

# Installation

[Installation documentation](https://docs.helix-editor.com/install.html).

[![Packaging status](https://repology.org/badge/vertical-allrepos/helix-editor.svg?exclude_unsupported=1)](https://repology.org/project/helix-editor/versions)

# Contributing

Contributing guidelines can be found [here](./docs/CONTRIBUTING.md).

# Getting help

Your question might already be answered on the [FAQ](https://github.com/helix-editor/helix/wiki/FAQ).

Discuss the project on the community [Matrix Space](https://matrix.to/#/#helix-community:matrix.org) (make sure to join `#helix-editor:matrix.org` if you're on a client that doesn't support Matrix Spaces yet).

# Credits

Thanks to [@jakenvac](https://github.com/jakenvac) for designing the logo!
