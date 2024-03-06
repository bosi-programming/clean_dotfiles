alias planos='show-list planos'

alias anime-list='show-list anime'
alias anime='anime-list'
alias anime-edit='edit-list anime'
alias anime-add='add-to-list anime'
alias anime-done='remove-from-list anime'
alias anime-avaliar='avaliar anime Anime'

alias jogos-list='show-list jogos'
alias jogos='jogos-list'
alias jogos-edit='edit-list jogos'
alias jogos-add='add-to-list jogos'
alias jogos-done='remove-from-list jogos'
alias jogos-avaliar='avaliar jogos Jogo'

alias literatura-list='show-list literatura'
alias literatura='literatura-list'
alias literatura-edit='edit-list literatura'
alias literatura-add='add-to-list literatura'
alias literatura-done='remove-from-list literatura'
alias literatura-avaliar='avaliar literatura Livro'

alias filosofia-list='show-list filosofia'
alias filosofia='filosofia-list'
alias filosofia-edit='edit-list filosofia'
alias filosofia-add='add-to-list filosofia'
alias filosofia-done='remove-from-list filosofia'
alias filosofia-avaliar='avaliar filosofia Livro'

alias estudos-list='show-list estudos'
alias estudos='estudos-list'
alias estudos-edit='edit-list estudos'
alias estudos-add='add-to-list estudos'
alias estudos-done='remove-from-list estudos'
alias estudos-avaliar='avaliar estudos Estudo'

alias auto-pos-list='show-list auto-pos'
alias auto-pos='auto-pos-list'
alias auto-pos-edit='edit-list auto-pos'
alias auto-pos-add='add-to-list auto-pos'
alias auto-pos-done='remove-from-list auto-pos'

alias bucket-list='show-list bucket'
alias bucket='bucket-list'
alias bucket-edit='edit-list bucket'
alias bucket-add='add-to-list bucket'
alias bucket-done='remove-from-list bucket'

alias todo-list='show-list todo'
alias todo='todo-list'
alias todo-edit='edit-list todo'
alias todo-add='add-to-list todo'
alias todo-done='remove-from-list todo'

alias avaliados-list='clear && cat ~/dotfiles/listas/avaliados.csv | column -t -s "|"'

show-all-lists () {
  clear && ls ~/dotfiles/listas
}

edit-list () {
  nvim ~/dotfiles/listas/"$1".txt
}

show-list () {
  clear && cat ~/dotfiles/listas/"$1".txt -n
}

remove-from-list () {
  sed -i "$2"d ~/dotfiles/listas/"$1".txt
  show-list "$1"
}

avaliar () {
  resetarCor="\033[0m"
  textoVinho="\033[38;5;204m"

  linhaDoAnime=$(cat ~/dotfiles/listas/"$1".txt | sed "$2"!d)
  nome=$(echo "$linhaDoAnime" | cut -d"-" -f1)
  echo -e $textoVinho"Avaliando: $nome"$resetarCor

  current_year=$(date +%Y)
  current_month=$(date +%m)

  echo "Tipo (Anime, Jogo, Livro, Vídeo, Mangá):"; read tipo
  echo "Gênero:"; read genero
  echo "Nota: "; read nota
  echo "Interessância: "; read interessancia
  echo "Equipe: "; read equipe
  echo "$nome|$tipo|$genero|$current_month/$current_year|$equipe|$nota|$interessancia" >> ~/dotfiles/listas/avaliados.csv
  remove-from-list "$1" "$2"
}

add-to-list () {
  echo "$2" >> ~/dotfiles/listas/"$1".txt
  show-list "$1"
}
