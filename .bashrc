[ -n "$PS1" ] && source ~/.bash_profile;

# export PATH="$PATH:/opt/nvim/nvim"

eval "$(zoxide init bash)"

alias config='/usr/bin/git --git-dir=/home/hj/.cfg/ --work-tree=/home/hj'

# gitcf(){
# 		local message=""
# 		local branch=""
# 		local file=""
# 		while getops ":f:m:b:" opt; do
# 				case $opt in
# 						m) file="$OPTARG";;
# 						m) message="$OPTARG";;
# 						b) branch="$OPTARG";;
# 						*) echo "Invalid option:-$OPTARG">&2;return 1;;
# 				esac
# 		done
# shift$((OPTIND -1))
#
# if [ -n "$file"]; then
# 		config add "$file"
# fi
#
# }
