function tmpenv -d "Create a temporary virtual environment"
   set env_dir (mktemp -d)
   python3 -m venv --prompt "temp" $env_dir
   source $env_dir/bin/activate.fish
   echo "Created virtualenv with version" (python --version)
   echo "Installing dependencies..."
   python -m pip install --upgrade pip --quiet
   set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME ~/.config
   set DEFAULT_PACKAGES $XDG_CONFIG_HOME/virtualenv-fish/global_requirements.txt
   if test -e $DEFAULT_PACKAGES
       python -m pip install -r $DEFAULT_PACKAGES --quiet
   end
end
