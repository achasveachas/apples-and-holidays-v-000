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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].values.each do |holiday|
    holiday << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {holiday_name => supply_array}
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    puts season.to_s.capitalize << ":"
    holiday.each do |holiday, supplies|
      if holiday.to_s.include?("_")
        holiday_words = holiday.to_s.split("_")
        holiday_capitalized = holiday_words.collect do |word|
          word.capitalize!
        end
        holiday_s = holiday_capitalized.join(" ")
      else
        holiday_s = holiday.to_s.capitalize
      end
      case
        when supplies.length == 1
          supplies.each do |supply|
            puts "  #{holiday_s}: #{supply}"
          end
        when supplies.length >= 2
          supplies = supplies.join(", ")
          puts "  #{holiday_s}: #{supplies}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_time = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supplies|
      bbq_time << holiday if supplies.include?("BBQ")
    end
  end
  bbq_time
end
