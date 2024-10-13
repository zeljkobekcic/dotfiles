-- set the leader keys at the start such that keybinds are not getting messed up
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("zeljkobekcic.000_bootstrap_lazyvim")
require("zeljkobekcic.001_options")
require("zeljkobekcic.010_plugins")
require("zeljkobekcic.020_keybindings")
-- vim: ts=2 sts=2 sw=2 et
