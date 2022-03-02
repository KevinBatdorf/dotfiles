
# mkdir and go into it
mkcd() { mkdir -p "$*";cd "$*";}

# run vagrant commands via homestead
function hs() {
    ( cd ~/Homestead && vagrant $* )
}

# ssh into vagrant
alias vm="homestead ssh"

alias pstorm="phpstorm"

# Lazy Git Commit
function lg() {
	git status -s
	git add .
	git commit -a -m "${1:-wip}"
	git push
}

alias nah="git reset --hard && git clean -df"

# Completion for the `wp` command
_wp_complete() {
	local OLD_IFS="$IFS"
	local cur=${COMP_WORDS[COMP_CWORD]}

	IFS=$'\n';  # want to preserve spaces at the end
	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

	if [[ "$opts" =~ \<file\>\s* ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	elif [[ $opts = "" ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	else
		COMPREPLY=( ${opts[*]} )
	fi

	IFS="$OLD_IFS"
	return 0
}
complete -o nospace -F _wp_complete wp

# rsync shortcut
function rs() {
  rsync -avz -e ssh $1 $2
}

# Dump homestead databases
alias dumpdb="mysqldump -u homestead -psecret --all-databases > ~/code/homestead.sql"
alias loaddb="mysql -u homestead -psecret < ~/code/homestead.sql"

alias python='python3'
alias pip='pip3'
alias phpunit='vendor/bin/phpunit'

# https://remysharp.com/2018/08/23/cli-improved
alias ping='prettyping --nolegend' #better ping
alias top="sudo htop" # alias top and fix high sierra bug
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules" # view file sizes
alias help='tldr' # better man pages

alias rm=trash

alias sed='gsed'
alias awk='gawk'
alias grep='ggrep'
alias head='ghead'
alias mktemp='gmktemp'
alias date='gdate'
alias cut='gcut'
alias tr='gtr'
alias cat='gcat'
alias sort='gsort'
alias kill='gkill'
alias base64='gbase64'
alias pr='gpr'

# Home brew
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# Fuzzy back searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias preview="fzf --preview 'bat --color \"always\" {}'"

# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export PATH="/usr/local/sbin:$PATH"

export CYPRESS_TESTING_KEY="f2cc55-04e147-ace600-ef96cd-1d3f7f"

eval "$(starship init zsh)"
