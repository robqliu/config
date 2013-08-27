# no terminal beep
set nobeep

# gcc and valgrind flags
alias c123='gcc -W -Wextra -Wall -O2'
alias val123='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes
--num-callers=20 --track-fds=yes'

export EDITOR=/usr/bin/vim
# svn editor (e.g. commit mesages)
export SVN_EDITOR=/usr/bin/vim
# Ignore .svn when grepping
export GREP_OPTIONS=--exclude-dir=".svn"

# add color to ls and grep if possible
if [ -x /usr/bin/dircolors ]; 
then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

	# make ls more awesome
	alias ls='ls --color=auto --group-directories-first'

	# make grep more awesome
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Change magenta filename coloring (blends too well with black background)
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=33:ln=32:bn=32:se=36'

# ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Only source if the script returns a 0. Short circuit otherwise
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# 18349 cross-compiler
export PATH=/usr/local/bin/opt/bin:$PATH

# 18549 (opencv)
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
# Linking shared objects
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
