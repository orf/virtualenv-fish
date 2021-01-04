function tmpenv -d "Create a temporary virtual environment" -a python
   set env_dir (mktemp -d)
   if test -n "$python"
      set pypath (pyenv prefix (pyenv latest -p $python))
      $pypath/bin/python -m venv --prompt "temp" $env_dir
   else
      python3 -m venv --prompt "temp" $env_dir
   end
   source $env_dir/bin/activate.fish
   echo "Created virtualenv with version" (python --version)
   echo "Installing dependencies..."
   python -m pip install --upgrade pip --quiet
   set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME ~/.config
   set DEFAULT_PACKAGES $XDG_CONFIG_HOME/virtualenv-fish/global_requirements.txt
   if test -e "$DEFAULT_PACKAGES"
       python -m pip install -r $DEFAULT_PACKAGES --quiet
       echo "Installed" (string trim -- (wc -l < $DEFAULT_PACKAGES)) "packages"
   end
end
