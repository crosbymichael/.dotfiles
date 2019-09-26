#!/bin/bash
set -euxo pipefail

# update vim plugins
repos=$(cat <<-END
https://github.com/cespare/vim-toml.git
https://github.com/kien/ctrlp.vim.git
https://github.com/chr4/nginx.vim.git
https://github.com/majutsushi/tagbar.git
https://github.com/Chiel92/vim-autoformat.git
https://github.com/tpope/vim-fugitive.git
https://github.com/tpope/vim-unimpaired.git
https://github.com/dgryski/vim-godef.git
https://github.com/airblade/vim-gitgutter.git
https://github.com/xavierd/clang_complete.git
https://github.com/garbas/vim-snipmate.git
https://github.com/tpope/vim-vinegar.git
https://github.com/terryma/vim-multiple-cursors.git
https://github.com/tpope/vim-surround.git
https://github.com/tpope/vim-sensible.git
https://github.com/tpope/vim-commentary.git
https://github.com/tpope/vim-dispatch.git
https://github.com/tpope/vim-unimpaired.git
https://github.com/tpope/vim-dadbod.git
END
)

git config --global fetch.fsckobjects false

cd bundle

for repo in $repos
do
	name=$(basename $repo | sed 's/\.git//')
	echo "updating $name..."
	rm -rf $name
	git clone $repo
	rm -rf $name/.git
done


git config --global fetch.fsckobjects true
