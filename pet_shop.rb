def pet_shop_name(shop_name)
  return shop_name[:name]
end


def total_cash(pets_shop)
  return pets_shop[:admin][:total_cash]
end


def add_or_remove_cash(cash_shop, cash_amount)
    cash_shop[:admin][:total_cash] += cash_amount
end


def pets_sold(sold)
  return sold[:admin][:pets_sold]
end


def increase_pets_sold(sold, num)
  sold[:admin][:pets_sold] += num
end


def stock_count(stock)
  return stock[:pets].count()
end


def pets_by_breed(pets_shop, breed)
pets_found =[]
  for pets in pets_shop[:pets]
    if pets[:breed] == breed
      pets_found << "Found"
    end
  end
return pets_found
end


def find_pet_by_name(pets_shop,name)
  for pets in pets_shop[:pets]
    if pets[:name] == name
      return pets
    end
  end
return nil
end


def remove_pet_by_name(pets_shop,name)
  for pets in pets_shop[:pets]
       pets.delete_if {pets[:name] == name}
  end
end


def add_pet_to_stock(pets_shop, new_pet)
  pets_shop[:pets] << new_pet
end


def stock_count(pets_shop)
  return pets_shop[:pets].count
end


def customer_pet_count(customers)
  return customers[:pets].count
end


def add_pet_to_customer(customers, new_pet)
  customers[:pets] << new_pet
end


def customer_can_afford_pet(customers,new_pet)
  customers[:cash] > new_pet[:price]
end


def sell_pet_to_customer(pets_shop,pet,customers)
#pet will return nil from find_pet_by_name(@pet_shop,"Dave") so need to use 'if'
  if pet != nil

    for pets_hash in pets_shop[:pets]
      if (pets_hash[:name] == pet[:name]) && (customers[:cash] < pets_hash[:price])
        #this will use 'test_sell_pet_to_customer__insufficient_funds'
      elsif pets_hash[:name] == pet[:name]
        #this will use 'test_sell_pet_to_customer__pet_found'
        customers[:pets] << pet[:name]
        pets_shop[:admin][:pets_sold] += 1
        pets_shop[:admin][:total_cash] += pets_hash[:price]
      end

    end

  else
    #this will use 'test_sell_pet_to_customer__pet_not_found'
  end

end
