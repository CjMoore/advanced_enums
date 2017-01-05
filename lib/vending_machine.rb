require_relative 'snack'


class VendingMachine

  attr_accessor :inventory

  def initialize
    @inventory = Array.new
  end

  def add_snack(snack)
    @inventory << snack
  end

  def snacks_by_name
    @inventory.map do |snack|
      snack.name
    end
  end

  def how_many_snacks
    snacks_by_number = Hash.new

    @inventory.each do |snack|
      if snacks_by_number.keys.include?(snack.quantity)
        snacks_by_number[snack.quantity] << snack
      else
      snacks_by_number[snack.quantity] = Array.new
      snacks_by_number[snack.quantity] << snack
      end
    end
    snacks_by_number
  end

end
