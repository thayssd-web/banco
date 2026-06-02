require 'json'

class PessoaData

  ARQUIVO = 'pessoas.json'

  def initialize
    @pessoas = []
    carregar
  end

  def add pessoa
    @pessoas.push pessoa
    salvar
  end

  def listar
    @pessoas
  end

  private

  def carregar
    return unless File.exist?(ARQUIVO)

    dados = JSON.parse(File.read(ARQUIVO))

    @pessoas = dados.map do |pessoa|
      Pessoa.new(
        pessoa['cpf_cnpj'],
        pessoa['nome'],
        pessoa['endereco']
      )
    end
  end

  def salvar
    dados = @pessoas.map(&:to_h)

    File.write(
      ARQUIVO,
      JSON.pretty_generate(dados)
    )
  end
end

