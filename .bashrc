# set prompt
export PS1='\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0m\]\h\[\e[1;37m\] \[\e[0;33m\]\w\[\e[0;34m\] $ps1_git_status\[\e[0m\]\n$ '

# no terminal beep
set nobeep

export EDITOR=vim

export PATH=~/.cargo/bin:~/bin:$PATH

export ANDROID_HOME=/usr/lib/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64

# Not sure if this is necessary for generating gpg keys... but I did it
# https://superuser.com/a/1407685
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

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

# git stuff
if [ -f /etc/bash_completion ];
then
	. /etc/bash_completion
fi
# https://github.com/jimeh/git-aware-prompt
# https://stackoverflow.com/questions/1593051/how-to-programmatically-determine-the-current-checked-out-git-branch
# sets abbreviated git status to an env variable since backticks requires forking
set_ps1_git_status() {
	local branchOrHash
	branchOrHash=$(git symbolic-ref --short -q HEAD 2> /dev/null)
	if [[ $? -eq 0 ]]
	then
		if [[ $(git diff-index HEAD 2> /dev/null) ]]
		then
			ps1_git_status="[$branchOrHash*]"
		else
			ps1_git_status="[$branchOrHash]"
		fi
	else
		branchOrHash=$(git rev-parse --short HEAD 2> /dev/null)
		if [[ $? -eq 0 ]]
		then
			ps1_git_status="[$branchOrHash]"
		else
			ps1_git_status=""
		fi
	fi
}
# update $ps1_git_status before printing prompt
PROMPT_COMMAND='set_ps1_git_status $PROMPT_COMMAND'

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

################ OLD #################
#18349 cross-compiler
export PATH=/usr/local/bin/opt/bin:$PATH

# 18549 (opencv)
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
# Linking shared objects
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
