require 'json'
require 'pry'

file = File.read('spec/fixtures/contestants.json')
data = JSON.parse(file)

def get_first_name_of_season_winner(data, season)
  data[season].each do |person, person_info|
    if person["status"] == "Winner"
      return person["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |person, person_info|
      if person["occupation"] == occupation
        return person["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, contestants|
    contestants.each do |person, person_info|
      if person["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    contestants.each do |person, person_info|
      return person["occupation"] if person["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  age_total = 0
  counter = 0
  data[season].each do |person|
    age_total += person["age"].to_f
    counter += 1
  end
  return (age_total/counter).round
end
