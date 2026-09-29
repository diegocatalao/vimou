# vimou

A small, plugin-light Vim config. Plugins are managed with Vim's native
packages (`pack/*/start`) as git submodules, no plugin manager needed.

## Install

Back up any existing config, then clone straight into `~/.vim`:

```sh
mv ~/.vim ~/.vim.bak 2>/dev/null
mv ~/.vimrc ~/.vimrc.bak 2>/dev/null
git clone --recurse-submodules git@github.com:diegocatalao/vimou.git ~/.vim
```

## After cloning

1. Make sure there is no `~/.vimrc`: it takes precedence over `~/.vim/vimrc`.
2. Open Vim and generate the plugins' help tags:

   ```vim
   :helptags ALL
   ```

The `swp/` and `undo/` directories are created on first start.

If you cloned without `--recurse-submodules`, fetch the plugins with:

```sh
git -C ~/.vim submodule update --init
```

## Plugins

Add one:

```sh
cd ~/.vim
git submodule add https://github.com/<user>/<plugin> pack/plugins/start/<plugin>
```

Update all:

```sh
git -C ~/.vim submodule update --remote --merge
```
