require_relative 'ui'

def tem_a_letra?(palavra, chute)
  palavra.include? chute
end

def substitui_chute_certo(palavra, chute, view)
  palavra.each_with_index do |letra, index|
    letra == chute ? view[index] = letra : view[index]
    view
  end
end

boas_vindas
avisa_escolha
palavra_secreta = "palavra"
array_palavra = palavra_secreta.chars
view_palavra = ['_', '_', '_', '_', '_', '_', '_']
diz_num_letras(palavra_secreta, view_palavra)

puts "Tentativa 1:"
chute = gets.chomp
puts "Seu chute foi #{chute}"

if tem_a_letra?(array_palavra, chute)
  puts "Acertou!"
  substitui_chute_certo(array_palavra, chute, view_palavra)
  puts "\n#{view_palavra.join(" ")}"
else
  puts "Errou!"
end

