export AUTOSWITCH_DEFAULTENV=default-3.5
export AUTOSWITCH_SILENT=true

function mkvenv() {
  venv_name="$(basename $PWD)"
  echo "$venv_name" > ".venv"
  mkvirtualenv "$venv_name" $@
}
