def tem_a_letra?(palavra, chute)
  palavra.include? chute
end

def substitui_chute_certo(palavra, chute, view)
  palavra.each_with_index do |letra, index|
    letra == chute ? view[index] = letra : view[index]
    view
  end
end

puts "****** Bem vindo ao jogo da forca!! ******"

puts "Escolhendo a palavra secreta..."
sleep(1)
palavra_secreta = "palavra"
array_palavra = palavra_secreta.chars
view_palavra = ['_', '_', '_', '_', '_', '_', '_']

puts "\n\n\nPronto, escolhida!\n\n\n"
sleep(1)
puts "Vamos começar! A palavra escolhida tem #{palavra_secreta.size} letras"
puts "#{view_palavra}\n\n"

puts "Tentativa 1:"
chute = gets.chomp

if tem_a_letra?(array_palavra, chute)
  puts "Acertou!"
  substitui_chute_certo(array_palavra, chute, view_palavra)
  p "#{view_palavra.join(" ")}"
else
  puts "Errou!"
end

