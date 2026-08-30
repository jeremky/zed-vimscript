# zed-vimscript

Vimscript language support for Zed: syntax highlighting, an outline view,
code folding, indentation, and bracket matching for `.vim` and `.vimrc` files.

- Highlighting for statements, options, mappings, autocommands, and embedded
  Lua/Ruby/Python/regex blocks, including Vimscript itself inside expression
  options like `foldexpr` and `indentexpr`
- Outline entries for functions, augroups, autocommands, user commands,
  mappings, for-loop variables, and global/script-scoped variables
- Folding for `if`, `for`, `while`, `try`, and function blocks
- Context-aware indentation that aligns `elseif`/`else`/`catch`/`finally`
  with their opening keyword and indents multi-line parens, lists, and
  dictionaries
- Bracket matching for `()`, `[]`, and `{}`

Powered by the [tree-sitter-vim](https://github.com/tree-sitter-grammars/tree-sitter-vim) grammar.

## Installation

```bash
git clone https://github.com/jeremky/zed-vimscript
```

In Zed, go to `Extensions`, click `Install Dev Extension`, and select the
`zed-vimscript` folder.

## Formatting (optional)

This extension doesn't ship a language server, so `editor: format` /
format-on-save does nothing for `.vim`/`.vimrc` files out of the box. If you
have `vim` (or `nvim`) installed, you can wire it up yourself as an external
formatter — no extra script to install, everything lives in your own Zed
`settings.json`:

```json
{
  "languages": {
    "Vimscript": {
      "formatter": {
        "external": {
          "command": "vim",
          "arguments": [
            "-Nes",
            "-u",
            "NONE",
            "-i",
            "NONE",
            "-c",
            "set ft=vim | runtime! indent/vim.vim | set expandtab shiftwidth=2 | execute \"normal! gg=G\" | wq! /dev/stdout",
            "/dev/stdin",
          ],
        },
      },
    },
  },
}
```

This runs Vim directly (no shell, no temp file): it reads the buffer from
`/dev/stdin`, reindents it with Vim's own `indent/vim.vim` runtime logic
(the same engine this extension's `indents.scm` mirrors for live typing),
and writes the result to `/dev/stdout`, which Zed reads back as the
formatted buffer. If `vim` isn't installed or the command fails, Zed reports
a formatting error instead of applying anything — it never silently
destroys content.

For Neovim, use `"nvim"` as `command` and replace the first five arguments
(`-Nes -u NONE -i NONE`) with `--headless --clean`. Adjust
`shiftwidth` if you don't use 2-space indentation, or drop the whole
`expandtab shiftwidth=2` part to fall back to Vim's own defaults (real tabs,
width 8) — just note that won't match what `indents.scm` produces while
typing.

## Development

See Zed's [Developing Extensions](https://zed.dev/docs/extensions/developing-extensions) guide.

## License

See [LICENSE](LICENSE).
