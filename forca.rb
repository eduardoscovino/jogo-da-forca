def boas_vindas
  puts "******************************************"
  puts "****** Bem vindo ao jogo da forca!! ******"
  puts "******************************************"
end

def diz_as_regras
  puts "Regras do jogo:"
  puts "1 - Escolha um tema"
  puts "2 - Digite seu chute (não há til ou acentuação nas palavras)"
  puts "Você tem 5 tentativas e a cada erro perde uma"
end

def pergunta_tema(temas)
  puts "Qual tema deseja jogar?"
  temas.each_with_index { |tema, index| puts "#{index + 1} - #{tema}"}
end

def mostra_tema_escolhido(temas, opcao)
  puts "Legal! Você escolheu #{temas[opcao - 1]}"
end
def sorteia_palavra(tema, palavra, frutas, esportes, cores)
  case tema
  when 1
    palavra_secreta = frutas[rand(0..frutas.size)]
  when 2
    palavra_secreta = esportes[rand(0..esportes.size)]
  when 3
    palavra_secreta = cores[rand(0..cores.size)]
  end
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

# diz as regras
diz_as_regras

# escolhendo o tema da forca
frutas = ["banana", "maça", "limao", "tangerina", "laranja", "uva", "abacaxi", "manga", "pera", "lichia", "figo"]
esportes = ["futebol", "handebol", "volei", "remo", "nataçao", "judo", "tiro", "taekwondo", "esgrima", "basquete", "tenis"]
cores = ["verde", "amarelo", "laranja", "vermelho", "azul", "branco", "preto", "violeta", "roxo", "lilas", "anil", "rubro", "rosa", "fucsia"]
array_temas = ["Frutas", "Esportes Olímpicos", "Cores"]
pergunta_tema(array_temas)
tema = gets.chomp.to_i
mostra_tema_escolhido(array_temas, tema)

# escolhendo a palavra
avisa_escolha
# palavra_secreta = ""
# sorteia_palavra(tema, palavra_secreta, frutas, esportes, cores)
palavra_secreta = "palavra"
array_palavra = palavra_secreta.chars
view_palavra = Array.new(array_palavra.size, "_")
diz_num_letras(palavra_secreta, view_palavra)

# setando as tentativas
max_tentativas = 5
tentativa_atual = 1

while tentativa_atual <= max_tentativas
  # num de tentativas
  avisa_tentativa(tentativa_atual, max_tentativas)

  # recebendo o chute
  pede_chute
  chute = gets.chomp.downcase
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
