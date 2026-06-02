class Conta

  attr_reader :numero, :titular, :saldo
  
  def initialize(numero, titular)
    @numero = numero
    @titular = titular
    @saldo = 0
  end

  def depositar valor
    @saldo += valor
  end

  def sacar valor
    return @saldo -= valor if valor <= @saldo 
    p "saldo insuficiente" 
  end

  def transferir destino, valor
    self.sacar valor
    destino.depositar valor
  end

  def exibir_saldo
    p "Saldo: R$ #{@saldo}"
  end
end
