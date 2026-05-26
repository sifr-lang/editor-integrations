# Sifr Editor Integration Assets

These assets are contribution-ready editor integrations for the current Sifr
tooling contract. Every target delegates semantic behavior to:

```bash
sifr lsp --stdio
```

The files in this directory may provide filetype detection, syntax highlighting,
and editor setup metadata. They must not implement parser, type-checker,
diagnostic, formatting, lint, codegen, rename, reference, or ownership logic.

Document formatting and range formatting are provided by the same LSP server.
Editors should call their standard LSP format command, with format-on-save wired
to the LSP client when enabled.

The CLI formatter remains available for CI, hooks, and manual-file workflows.
It is not the editor document-formatting provider. Formatter command and config
behavior is documented in the main Sifr repository's `docs/formatter.md`.

## Targets

- Neovim: `neovim/ftdetect/sifr.lua` and `neovim/lsp/sifr.lua`
- Zed: `zed/extension.toml` and `zed/languages/sifr/config.toml`
- Helix: `helix/languages.toml`
- Emacs: `emacs/sifr-mode.el`

## Syntax

`syntaxes/sifr.tmLanguage.json` provides baseline TextMate highlighting for
`.sifr` files. The grammar is checked against parser-token fixtures through
`verification/tooling/check_editor_assets.py`; semantic tokens still come from
the native LSP server.
