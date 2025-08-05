[ -n "$PS1" ] && source ~/.bash_profile;

export PATH="$PATH:/opt/nvim/bin"

eval "$(zoxide init bash)"

alias config='/usr/bin/git --git-dir=/home/hj/.cfg/ --work-tree=/home/hj'
config config status.showUntrackedFiles no

cgit() {
  # Show help if no arguments
  if [ $# -eq 0 ]; then
    echo "Usage: cgit -f <file> [-m <message>] [-b <branch>]"
    return
  fi

  # Parse arguments
  local message=""
  local branch="nightly"  # default branch
  local file=""

  while getopts ":f:m:b:" opt; do
		  echo "opt: $opt  OPTARG: $OPTARG"
    case $opt in
      f) file="$OPTARG" ;;
      m) message="$OPTARG" ;;
      b) branch="$OPTARG" ;;
      *) echo "Invalid option: -$OPTARG"; return 1 ;;
    esac
  done


  # # Check if file is provided
  # if [ -z "$file" ]; then
  #   echo "Error: -f <file> is required."
  #   return 1
  # fi

  echo "File: $file, Message: $message, Branch: $branch"
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
