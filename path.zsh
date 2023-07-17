export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=/usr/local/bin:$PATH

# Composer stuff
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Deno global installed binaries
export PATH="$HOME/.deno/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

#  get python version and put in variable
PV=$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1-2)
export PATH="/opt/homebrew/opt/python@${PV}/libexec/bin:$PATH"
