require_relative "conta"

class ContaCorrente < Conta

  attr_reader :limite

  def initialize(numero, titular)
    super(numero, titular)
    @limite = 150
  end

  def exibir_saldo
    p "Saldo R$ #{@saldo}"
    p "Limite R$ #{@limite}"
    p "Total: R$ #{@saldo + @limite}"
  end

  def sacar valor
    return @saldo -= valor if valor <= saldo_disponivel
    p "Saldo insuficiente"
  end

  def saldo_disponivel
    @saldo + @limite
  end
  
end
