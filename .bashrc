[ -n "$PS1" ] && source ~/.bash_profile;

export PATH="$PATH:/opt/nvim/bin"

eval "$(zoxide init bash)"

# config() {
# /usr/bin/git --git-dir=/home/hj/.cfg/ --work-tree=/home/hj "$@"
# }
alias config='/usr/bin/git --git-dir=/home/hj/.cfg/ --work-tree=/home/hj'
config config status.showUntrackedFiles no

cgit() {
  if [ $# -eq 0 ]; then
    echo "Usage: cgit -f <file> [-m <message>] [-b <branch>]"
    return
  fi

  local message=""
  local branch="nightly"
  local file=""

	OPTIND=1
  while getopts ":f:m:b:" opt; do
    case $opt in
      f) file="$OPTARG" ;;
      m) message="$OPTARG" ;;
      b) branch="$OPTARG" ;;
      *) echo "Usage: cgit -f <file> [-m <message>] [-b <branch>]"; return 1 ;;
    esac
  done

  # if [[ -z "$file" ]]; then
  #   echo "Error: -f <file> is required."
  #   return 1
  # fi

  shift $((OPTIND -1))
  echo "File: $file, Message: $message, Branch: $branch"

  config add "$file"

  if [ -n "$message" ]; then
    config commit -m "$message"
  else
    config commit -m "Updated $file"
  fi

  config push origin "$branch"
}

