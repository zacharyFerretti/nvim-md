# nvim-md

This plugin is designed to be lightweight, with no external dependencies, enabling quick and easy Markdown formatting in Neovim.

## Installation

### With LazyVim

To install alongside your LazyVim setup just add the following in your plugins directory.

```lua
return {
  {
    "zacharyFerretti/nvim-md",
    config = function()
      require("nvim_md").setup()
    end,
  },
}
```

## Usage

All of the keybindings below work in both `Normal` and `Visual` modes.

- In `Normal` mode, they perform the described action on the current word.
- In `Visual` mode, they perform the described action on the current selection.

### Keybinds

1. `<Leader>mb` - Wraps the current word or selection in double asterisks, `**` to bold the text.
2. `<Leader>mi` - Wraps the current word or selection in single asterisks, `*` to italicize the text.
3. `<Leader>ms` - Wraps the current word or selection in double tildes, `~~` to strikethrough the text.
4. `<Leader>mc` - Wraps the current word or selection in single backticks,"`" to make the text inline-code.
5. `<Leader>m{1-6}` - Prepends the current line with 1-6 `#` characters followed by a space, to put the current line in header-syntax for Markdown.
   - For example, `<Leader>m2` would make the line a Level 2 Markdown header.

## To Fix

### High Priority

- [ ] **KeyBinds should toggle the relevant effect**.
  - _Currently, if you have a selection "wrapped" by doing it again, we just add another set of surrounding characters. I'd like it to toggle the wrap instead (i.e. remove them if they are already there)_.

### Low Priority

- [ ] **Better Multi-line Support**
  - _When wrapping multiple non-consecutive lines add more than two sets of the surrounding character so that all of the selected lines have the relevant effect applied to them._

## To Add

In a fully fleshed out version of the plugin, I want the user to be able to:

- [x] **Update**: Completed 06.10.2025 - ~~Prepend header indicators (_`#` for H1; `##` for H2; etc._) at front of current line.~~
- [ ] Convert multiple lines to a multi-line code-block.
- [ ] Select a string, and wrap it in the necessary characters for it to be a hyperlink.
- [ ] Should work when using `Visual Block` mode as well (right now moves all text to where first selection was).
