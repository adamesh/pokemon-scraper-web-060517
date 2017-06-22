require 'SQLite3'
require 'pry'


class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(info_hash)
    @id = info_hash[:id]
    @name = info_hash[:name]
    @type = info_hash[:type]
    @hp = info_hash[:hp]
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
      type:poke_stats[2],
      hp:poke_stats[3]}
      )
  end

  def alter_hp(hp, db)
    command = "UPDATE pokemon SET hp = #{hp} WHERE id = '#{self.id}'"
    db.execute(command)
  end


end
