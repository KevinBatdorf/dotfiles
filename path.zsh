export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=/usr/local/bin:$PATH

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Composer stuff
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Spark
export PATH="$PATH:$HOME/code/spark-installer"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"
