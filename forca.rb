require_relative 'metodos'
require_relative 'ui'

# dando boas vindas
boas_vindas

# diz as regras
diz_as_regras

# escolhendo o tema da forca
frutas = ["banana", "maça", "limao", "tangerina", "laranja", "uva", "abacaxi", "manga", "pera", "lichia", "figo"]
esportes = ["futebol", "handebol", "volei", "remo", "nataçao", "judo", "tiro", "taekwondo", "esgrima", "basquete", "tenis"]
cores = ["verde", "amarelo", "laranja", "vermelho", "azul", "branco", "preto", "violeta", "roxo", "lilas", "anil", "rubro", "rosa", "fucsia"]
array_temas = ["Frutas", "Esportes Olímpicos", "Cores"]
escolheu_tema = false
while escolheu_tema == false
  pergunta_tema(array_temas)
  tema = gets.chomp.to_i
  if (1..3).include? tema
    escolheu_tema = true
  else
    puts "Opção inválida. Tente novamente"
  end
end
mostra_tema_escolhido(array_temas, tema)

# escolhendo a palavra
avisa_escolha
palavra_secreta = sorteia_palavra(tema, frutas, esportes, cores)
array_palavra = palavra_secreta.chars
view_palavra = Array.new(array_palavra.size, "_")
diz_num_letras(palavra_secreta, view_palavra)

# setando as tentativas
max_tentativas = 4
tentativa_atual = 0
ganhou_jogo = false

while tentativa_atual <= max_tentativas
  # num de tentativas
  avisa_tentativa(tentativa_atual, max_tentativas)

  # recebendo o chute
  pede_chute
  chute = gets.chomp.downcase
  avisa_chute(chute)

  # bifurcaçao palavra e letra
  if eh_palavra?(chute)
    if palavra_correta?(chute, palavra_secreta)
      ganhou_jogo = true
      view_palavra = chute.chars
      tentativa_atual = max_tentativas + 1
    else
      errou_chute(view_palavra)
      tentativa_atual += 1
    end
  else
    if tem_a_letra?(array_palavra, chute)
      acertou_chute(array_palavra, chute, view_palavra)
    else
      errou_chute(view_palavra)
      tentativa_atual += 1
    end
  end
  # desenho da forca
  desenha_forca(tentativa_atual)
  # proximo chute
  if array_incompleto?(view_palavra)
    puts "Próximo chute"
  else
    ganhou_jogo = true
    tentativa_atual = max_tentativas + 1
  end
end

mensagem_resultado(ganhou_jogo, palavra_secreta)
fim_do_jogo