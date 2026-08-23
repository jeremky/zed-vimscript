# zed-vimscript

Vimscript language support for Zed: syntax highlighting, indentation, code
folding, bracket matching, and an outline view for `.vim` and `.vimrc` files.

- Highlighting for statements, options, mappings, autocommands, and embedded
  Lua/Ruby/Python/regex blocks
- Outline entries for functions, augroups, autocommands, user commands,
  mappings, and global/script-scoped variables
- Folding for `if`, `for`, `while`, `try`, and function blocks

Powered by the [tree-sitter-vim](https://github.com/tree-sitter-grammars/tree-sitter-vim) grammar.

## Installation

```bash
git clone https://github.com/jeremky/zed-vimscript
```

In Zed, go to `Extensions`, click `Install Dev Extension`, and select the
`zed-vimscript` folder.

## Development

See Zed's [Developing Extensions](https://zed.dev/docs/extensions/developing-extensions) guide.

## License

See [LICENSE](LICENSE).
