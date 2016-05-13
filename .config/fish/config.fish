# Path to Oh My Fish install.
set -gx OMF_PATH "/home/charlie/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/charlie/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set fish_greeting ""

# Override locale
export LANG=en_GB.UTF-8

# Start tmux session on launch
if status --is-interactive
   if test -z (echo $TMUX)
      tmux
   end
end
