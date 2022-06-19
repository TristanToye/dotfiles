export VISUAL=code
export EDITOR="$VISUAL"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export THOR_MERGE=EDITOR

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# https://docs.brew.sh/Shell-Completion
# HOMEBREW_PREFIX=$(brew --prefix)
# if type brew &>/dev/null; then
#   for COMPLETION in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*
#   do
#     [[ -f $COMPLETION ]] && source "$COMPLETION"
#   done
#   if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]];
#   then
#     source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
#   fi
# fi

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# OpenSSL
export PATH="/Users/tristantoye/.rbenv/versions/2.7.6/opensslbin:$PATH"
export LDFLAGS="-L/Users/tristantoye/.rbenv/versions/2.7.6/openssl/lib"
export CPPFLAGS="-I/Users/tristantoye/.rbenv/versions/2.7.6/openssl/include"
export PKG_CONFIG_PATH="/Users/tristantoye/.rbenv/versions/2.7.6/openssl/lib/pkgconfig"
export DYLD_LIBRARY_PATH="/Users/tristantoye/.rbenv/versions/2.7.6/openssl/lib"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# YARN
export YVM_DIR=/Users/tristantoye/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tristantoye/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tristantoye/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tristantoye/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tristantoye/google-cloud-sdk/completion.zsh.inc'; fi
