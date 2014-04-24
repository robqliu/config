# set prompt
export PS1='\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0m\]\h\[\e[0m\] \[\e[0;33m\]\w\[\e[0m\]$ '

# no terminal beep
set nobeep

# gcc and valgrind flags
alias gcc='gcc -Wextra -Wall -O2'
alias g++='g++ -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings'
alias gppcf='g++ -static -fno-optimize-sibling-calls -fno-strict-aliasing -DONLINE_JUDGE -lm -s -x c++ -O2'
alias valgrind='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes'
if type -P ack-grep > /dev/null 2>&1; then
	alias ack='ack-grep'
fi

# clang flags
alias clang='clang -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings'
alias clang++='clang++ -Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wwrite-strings'

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

# Fix dark blue directories on dark background
export LS_COLORS='rs=0:di=01;04;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

# Change magenta filename coloring (blends too well with black background)
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=01;32:ln=32:bn=32:se=36'

# ruby
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# 18349 cross-compiler
export PATH=/usr/local/bin/opt/bin:$PATH

# 18549 (opencv)
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
# Linking shared objects
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
