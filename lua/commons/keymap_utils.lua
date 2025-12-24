function setKeyMap (mode, keys, func, opt)
  local finalOpt = opt or {};
  vim.keymap.set(mode, keys, func, finalOpt);
end

return setKeyMap;
