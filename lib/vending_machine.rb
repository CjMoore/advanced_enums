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

  def inventory_by_alphabet
    inventory_by_alphabet = Hash.new

    @inventory.each do |snack|
      if inventory_by_alphabet.keys.include?(snack.name[0])
        inventory_by_alphabet[snack.name[0]] << snack
      else
        inventory_by_alphabet[snack.name[0]] = Array.new
        inventory_by_alphabet[snack.name[0]] << snack
      end
    end
    inventory_by_alphabet
  end

  def total_num_items
    @inventory.reduce(0) do |sum, snack|
      sum + snack.quantity
    end
  end

  def first_letters
    @inventory.map do |snack|
      snack.name[0]
    end.join
  end

  def change_indexes
    new_indexes = Array.new
    @inventory.each_with_index do |snack, index|
      new_indexes << index += 1
    end
    new_indexes
  end


end
