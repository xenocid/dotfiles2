
add_to_path () {
  export PATH=$1:$PATH
  success "added $1 to PATH"
}
