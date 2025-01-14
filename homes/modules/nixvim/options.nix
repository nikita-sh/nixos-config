{
  colorschemes = {
    gruvbox.enable = true;
  };
  globals.mapleader = ";";
  autoCmd = [
    {
      event = [ "VimEnter" ];
      callback = { __raw = "function() if vim.fn.argv(0) == '' then require('telescope.builtin').find_files() end end"; };
    }
  ];

}
