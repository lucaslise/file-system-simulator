module DiscosHelper
  def cor_bloco(i)
    @disco.informacoes_disco.find_by(tipo: @disco.dados[i]).try(:cor_bloco)
  end

  def para_deletar
     deletar =  @disco.dados.chars.uniq
     deletar.delete('-')
     deletar.delete('!')
     deletar
  end

  def para_adicionar
    armazenados = @disco.dados.chars.uniq
    ('A'..'Z').to_a - armazenados
  end

  def disco_possui_dados?
    @disco.dados.count('-') < Disco::TAMANHO_DISCO
  end

  def disponivel
    @disco.dados.count('-')
  end

  def usado
     Disco::TAMANHO_DISCO - @disco.dados.count('-')
  end
end
