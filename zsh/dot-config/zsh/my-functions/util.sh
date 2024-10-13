function __check_program_installed() {
  requiredProgram="$1"
  if ! [ -x "$(command -v "$requiredProgram")" ]; then
    echo "Error: $requiredProgram is not installed." >&2
    return 1
  fi
}

