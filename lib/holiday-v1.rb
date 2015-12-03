require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  second_supply = ""
  holiday_hash.each do |season, attributes_hash|
    attributes_hash.each do |holiday, supplies|
      if holiday == :fourth_of_july
        second_supply = supplies[1]
      end
    end
  end
  second_supply
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, attributes_hash|
    attributes_hash.each do |holiday, supplies|
      if holiday == :christmas || holiday == :new_years
        supplies << supply
      end
    end
  end
  holiday_hash
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, attributes_hash|
    attributes_hash.each do |holiday, supplies|
      if holiday == :memorial_day
        supplies << supply
      end
    end
  end
  holiday_hash  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |time_of_year, attributes_hash|
    if time_of_year == season
      attributes_hash[holiday_name] = supply_array
    end
  end
  holiday_hash  
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, attributes_hash|
    if season == :winter
      winter_supplies = attributes_hash.values.flatten
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, attributes_hash|
    puts "#{season.capitalize}:"
    attributes_hash.each do |holiday_symbol, supplies|
      holiday_array = holiday_symbol.to_s.split("_")
      holiday_string = holiday_array.collect {|parse| parse.capitalize}.join(" ")
      puts "  #{holiday_string}: #{supplies.join(", ")}"
    end
  end  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |season, attributes_hash|
    attributes_hash.each do |holiday, supplies|
      supplies.include?("BBQ") ? bbq_holidays << holiday : bbq_holidays
    end
  end
  bbq_holidays
end


