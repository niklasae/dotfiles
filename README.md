# dotfiles

Personal config for macOS and Linux, managed by [mise](https://mise.jdx.dev).
The repo is the source of truth; `mise dot apply` symlinks files into `~`.

## New machine

```sh
curl -fsSL https://raw.githubusercontent.com/niklasae/dotfiles/master/bootstrap.sh | sh
```

Or manually:

```sh
curl -fsSL https://mise.run | sh
git clone git@github.com:niklasae/dotfiles.git ~/Code/niklasae/dotfiles
mkdir -p ~/.config/mise
ln -sf ~/Code/niklasae/dotfiles/mise/config.toml ~/.config/mise/config.toml
cd ~/Code/niklasae/dotfiles && mise trust && mise bootstrap --yes
```

`mise bootstrap` runs, in order: repos (oh-my-zsh), packages (brew on macOS,
apt on Linux), dotfiles, tools, login shell (Linux), macOS defaults, then the
hooks that restore Neovim plugins and install agent skills.

Then by hand:

1. `op signin` (1Password CLI)
2. `mise token github`
3. In Claude Code add plugins, for example: `/plugin marketplace add DietrichGebert/ponytail`
then `/plugin install ponytail@ponytail`
4. OpenCode: `/connect <provider>` for API keys

## Daily use

```sh
mise dot status                 # what differs from the repo
mise dot apply                  # (re)create links; --force to re-point a changed symlink
mise dot add --source ~/Code/niklasae/dotfiles/<path> <target>   # start managing a file
mise run skills                 # (re)install third-party agent skills
mise run skills:update          # pull newer versions of them
mise run nvim:restore           # reinstall Neovim plugins from lazy-lock.json
mise bootstrap packages status  # brew/apt drift
```

Edit files in place; the symlink lands the change in the repo. Commit when done.

## Machine-local config

`~/.config/mise/config.local.toml` is a real file, not in the repo. Put per-machine
values there (`[env] GIT_AUTHOR_EMAIL`, `OPENCODE_CONFIG`, extra dotfile entries).

## Agent skills

- Third-party skills (mattpocock/skills, superpowers) are installed by the
  `skills` task into `~/.claude/skills`, which OpenCode also reads. Not committed.
- My own skills live in `skills/` and are symlinked into `~/.claude/skills`;
  OpenCode reads them via the `skills` array in `opencode/opencode.jsonc`.
- Ponytail is a Claude Code plugin (skills + hooks), installed manually, see above.

## New target mise backed dotfiles

```bash
~/Code/niklasae/dotfiles/
├── agents/
│   ├── skills/               # Own skills
├── bootstrap.sh              # 6 lines, see Phase 9
├── mise/
│   ├── config.toml           # shared: settings, dotfiles, tools, tasks, hooks, repos
│   ├── config.macos.toml     # brew/cask/mas, macOS defaults, macOS-only dotfiles
│   └── config.linux.toml     # apt, login shell, Linux-only dotfiles
├── zsh/   zshrc zshenv zprofile aliases kubectl.zsh
├── git/   config ignore attributes
├── pip/   pip.conf
├── bin/
├── nvim/  nvim-pure/  archive/nvim-2024/
├── kitty/ gitui/ omp/ worktrunk/ aws-sso/ gh/config.yml
├── karabiner/karabiner.json          # macOS only
├── opencode/                          # skills/ and local/ ignored
├── claude/  settings.json CLAUDE.md commands/ agents/
├── README.md
└── .gitignore   # opencode/skills/ opencode/local/ karabiner/automatic_backups/
```

<!--
  Still to be added to bootstrap.
  https://docs.google.com/document/d/1DSF93qTPIr5GW6hKVy0fqlGEX7tnFw0LQG5ZE3UverE/edit?tab=t.0
-->
