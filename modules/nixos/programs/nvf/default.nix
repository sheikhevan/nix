{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.nvf = {
      e-ink.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'nvf' with the 'e-ink' rice?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.nvf.e-ink.enable {
    environment.systemPackages = with pkgs; [
      wl-clipboard
      stylua
      alejandra
      prettierd
      ruff
      clang
      clang-tools
    ];
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          enableLuaLoader = true;

          globals = {
            mapleader = " ";
            maplocalleader = "//";
          };

          options = {
            autowrite = true;
            clipboard = "unnamedplus";
            completeopt = "menu,menuone,noselect";
            conceallevel = 2;
            confirm = true;
            cursorline = true;
            expandtab = true;
            foldlevel = 99;
            ignorecase = true;
            inccommand = "nosplit";
            jumpoptions = "view";
            laststatus = 3;
            linebreak = true;
            list = true;
            mouse = "";
            number = true;
            relativenumber = true;
            pumblend = 10;
            pumheight = 10;
            ruler = false;
            scrolloff = 4;
            shiftround = true;
            shiftwidth = 2;
            showmode = false;
            sidescrolloff = 8;
            signcolumn = "yes";
            smartcase = true;
            smartindent = true;
            spelllang = "en";
            splitbelow = true;
            splitkeep = "screen";
            splitright = true;
            tabstop = 2;
            termguicolors = true;
            undofile = true;
            undolevels = 10000;
            updatetime = 200;
            virtualedit = "block";
            wildmode = "longest:full,full";
            winminwidth = 5;
            wrap = false;
            smoothscroll = true;
          };

          extraPlugins = {
            e-ink = {
              package = pkgs.vimUtils.buildVimPlugin {
                name = "e-ink";
                src = pkgs.fetchFromGitHub {
                  owner = "e-ink-colorscheme";
                  repo = "e-ink.nvim";
                  rev = "0f9131236ef0f443144d5545db02fa726f80bbd3";
                  sha256 = "sha256-3kw9CiJoIigVh/kjTeyR9uqpDoJa1HqRxG41ir8wgR0=";
                };
              };
              setup = ''
                require("e-ink").setup()
                vim.cmd.colorscheme "e-ink"
                vim.opt.background = "light"
              '';
            };
          };

          lazy.plugins = {
            "ts-comments.nvim" = {
              package = pkgs.vimPlugins.ts-comments-nvim;
              lazy = true;
              event = "BufEnter";
            };
            "twilight.nvim" = {
              package = pkgs.vimPlugins.twilight-nvim;
              lazy = true;
              cmd = "ZenMode";
            };
            "zen-mode.nvim" = {
              package = pkgs.vimPlugins.zen-mode-nvim;
              lazy = true;
              event = "BufEnter";
              setupOpts = {
                twilight = {
                  enabled = true;
                };
              };
            };
          };

          utility = {
            motion.flash-nvim.enable = true;
          };

          binds = {
            whichKey.enable = true;
          };

          git = {
            gitsigns = {
              enable = true;
              codeActions.enable = true;
            };
          };

          mini = {
            icons.enable = true;
            ai.enable = true;
            pairs = {
              enable = true;
              setupOpts = {
                modes = {
                  insert = true;
                  command = true;
                  terminal = false;
                };
                skip_next = ''[=[[%w%%%'%[%"%.%`%$]]=]'';
                skip_ts = ["string"];
                skip_unbalanced = true;
                markdown = true;
              };
            };
          };

          notes.obsidian = {
            enable = true;
            setupOpts = {
              workspaces = [
                {
                  name = "polymath";
                  path = "~/documents/obsidian/polymath";
                }
              ];

              completion = {
                nvim_cmp = true;
              };
            };
          };

          statusline.lualine.enable = true;
          telescope = {
            enable = true;
            extensions = [
              {
                name = "fzf";
                packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
                setup = {fzf = {fuzzy = true;};};
              }
            ];
          };
          autocomplete.nvim-cmp = {
            enable = true;
          };
          formatter.conform-nvim = {
            enable = true;
            setupOpts = {
              format_after_save = {
                lsp_format = "fallback";
                timeout_ms = 500;
              };
              formatters_by_ft = {
                lua = [
                  "stylua"
                ];
                nix = [
                  "alejandra"
                ];
                html = [
                  "prettierd"
                ];
                css = [
                  "prettierd"
                ];
                ts = [
                  "prettierd"
                ];
                tsx = [
                  "prettierd"
                ];
                svelte = [
                  "prettierd"
                ];
                astro = [
                  "prettierd"
                ];
                json = [
                  "prettierd"
                ];
                python = [
                  "ruff"
                ];
                c = [
                  "clangd"
                ];
                cpp = [
                  "clangd"
                ];
              };
            };
          };

          treesitter = {
            textobjects.enable = true;
            autotagHtml = true;
          };

          lsp = {
            enable = true;
            trouble.enable = true;
          };

          languages = {
            enableTreesitter = true;

            lua = {
              enable = true;
              lsp.enable = true;
            };
            nix = {
              enable = true;
              lsp.enable = true;
            };
            html = {
              enable = true;
            };
            css = {
              enable = true;
              lsp.enable = true;
            };
            ts = {
              enable = true;
              lsp.enable = true;
            };
            svelte = {
              enable = true;
              lsp.enable = true;
            };
            astro = {
              enable = true;
              lsp.enable = true;
            };
            tailwind = {
              enable = true;
              lsp.enable = true;
            };
            markdown = {
              enable = true;
              lsp.enable = true;
            };
            python = {
              enable = true;
              lsp.enable = true;
              format = {
                enable = true;
                type = "ruff";
              };
            };
            clang = {
              enable = true;
              lsp.enable = true;
            };
          };
        };
      };
    };
  };
}
