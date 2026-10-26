#!/bin/sh
# Bootstrap a new macOS or Linux machine from niklasae/dotfiles.
# Idempotent: safe to re-run to repair an existing machine.
set -eu

REPO_URL="git@github.com:niklasae/dotfiles.git"
REPO_HTTPS="https://github.com/niklasae/dotfiles.git"
R="$HOME/Code/niklasae/dotfiles"

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

# 1. Minimum prerequisites (git on a bare Linux box)
if ! command -v git >/dev/null 2>&1; then
  case "$(uname -s)" in
  Linux)
    log "Installing git"
    sudo apt-get update -qq && sudo apt-get install -y -qq git
    ;;
  Darwin)
    log "Installing Xcode CLT (provides git)"
    xcode-select --install || true
    until command -v git >/dev/null 2>&1; do sleep 10; done
    ;;
  esac
fi

# 2. mise
if ! command -v mise >/dev/null 2>&1; then
  log "Installing mise"
  curl -fsSL https://mise.run | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

# 3. Repo (SSH if a key is present, HTTPS otherwise; switch remote later)
if [ ! -d "$R/.git" ]; then
  log "Cloning dotfiles to $R"
  mkdir -p "$(dirname "$R")"
  if ssh -o BatchMode=yes -o ConnectTimeout=5 -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    git clone "$REPO_URL" "$R"
  else
    git clone "$REPO_HTTPS" "$R"
    log "Cloned over HTTPS; run: git -C $R remote set-url origin $REPO_URL once SSH is set up"
  fi
fi

# 4. Chicken-and-egg: mise's own config must exist before it can manage itself.
#    Only config.toml is linked here; the first `mise dot apply` links the rest via symlink-each.
mkdir -p "$HOME/.config/mise"
ln -sf "$R/mise/config.toml" "$HOME/.config/mise/config.toml"

# 5. Hand over to mise
cd "$R"
log "Trusting config"
mise trust --yes
log "Running bootstrap (repos, packages, dotfiles, tools, shell, defaults, hooks)"
mise bootstrap --yes

# 6. Report
log "Status"
mise dot status || true
mise bootstrap packages status || true

cat <<'EOF'

Done. Remaining manual steps:
  1. op signin
  2. mise token github
  3. Claude Code: /plugin marketplace add DietrichGebert/ponytail && /plugin install ponytail@ponytail
  4. OpenCode: /connect <provider>
  5. Open a new shell (login shell / mise activate take effect on next login)
EOF
