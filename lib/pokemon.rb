require 'SQLite3'
require 'pry'


class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    @id = info_hash[:id]
    @name = info_hash[:name]
    @type = info_hash[:type]
    @@db = info_hash[:db]
  end

  def self.save(name, type, db)
    command = "INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');"
    db.execute(command)
  end

  def self.find(id, db)
    command = "SELECT * FROM pokemon WHERE id = '#{id}'"
    poke_stats = db.execute(command).first
    new_pokemon = Pokemon.new(
      {id:poke_stats[0],
      name:poke_stats[1],
      type:poke_stats[2]}
      )
  end


end
