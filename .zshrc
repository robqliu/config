# no terminal beep
set nobeep

export EDITOR=vim

export PATH=~/.cargo/bin:~/bin:$PATH

# svn
export SVN_EDITOR=vim
export GREP_OPTIONS=--exclude-dir=".svn"

# add color to ls and grep if possible. This must be run before exporting
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
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=01;32:ln=32:bn=32:se=36'
export LS_COLORS='rs=0:di=01;04;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

# git auto-complete
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# gcc and valgrind flags
alias gcc='gcc -Wextra -Wall -O2'
alias g++='g++ -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings'
alias valgrind='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes'

# clang flags
alias clang='clang -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings'
# I don't actually code c++ so who cares about portability
alias clang++='clang++ -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings -std=c++11'
alias cf='clang++ -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings -Wno-c++11-extensions -m32'

if [ -x "$(command -v fzf)" ] && [ -x "$(command -v rg)" ]; then
	export FZF_DEFAULT_COMMAND='rg --files -u --glob ""'
fi

# Prevent ctrl+D from killing the shell. If we do it n times in a row it will actually close it. Otherwise
# it emits an error message explaining why it isn't working (right now at least)
IGNOREEOF=10

