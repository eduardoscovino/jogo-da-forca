def boas_vindas
  puts "****** Bem vindo ao jogo da forca!! ******"
end

def avisa_escolha
  puts "Escolhendo a palavra secreta..."
  sleep(1)
  puts "\n\nPronto! Palavra escolhida!"
end

def diz_num_letras(palavra_secreta, view)
  sleep(1)
  puts "Vamos começar! A palavra escolhida tem #{palavra_secreta.size} letras"
  puts "\n\n#{view.join(" ")}\n\n"
end

def avisa_tentativa(tentativa, maximo)
  puts "Tentativa #{tentativa} de #{maximo} possíveis"
end

def pede_chute
  puts "Qual é o seu chute?"
end

def avisa_chute(chute)
  puts "Seu chute foi #{chute}"
end

def tem_a_letra?(palavra, chute)
  palavra.include? chute
end

def acertou_chute(array, chute, view)
  puts "Acertou!"
  substitui_chute_certo(array, chute, view)
  puts "\n#{view.join(" ")}"
end

def errou_chute
  puts "Errou!"
end

def substitui_chute_certo(palavra, chute, view)
  palavra.each_with_index do |letra, index|
    letra == chute ? view[index] = letra : view[index]
    view
  end
end

def completou_array?(view)
  view.include? "_"
end

# dando boas vindas
boas_vindas
avisa_escolha

# escolhendo a palavra
palavra_secreta = "palavra"
array_palavra = palavra_secreta.chars
view_palavra = ['_', '_', '_', '_', '_', '_', '_']
diz_num_letras(palavra_secreta, view_palavra)

# setando as tentativas
max_tentativas = 5
tentativa_atual = 1

while tentativa_atual <= max_tentativas
  # num de tentativas
  avisa_tentativa(tentativa_atual, max_tentativas)

  # recebendo o chute
  pede_chute
  chute = gets.chomp
  avisa_chute(chute)

  if tem_a_letra?(array_palavra, chute)
    acertou_chute(array_palavra, chute, view_palavra)
  else
    errou_chute
    tentativa_atual += 1
  end

  if completou_array?(view_palavra)
    puts "Próximo chute"
  else
    tentativa_atual = 6
    puts "Ganhou o jogo! A palavra era #{view_palavra.join}"
  end
end

puts "\n\nFim do jogo"
