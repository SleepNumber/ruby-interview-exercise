class Person
  attr_reader :id, :name, :manager
  def initialize(id, name, manager)
    @id = id
    @name = name
    @manager = manager
  end
  
  def to_s
    "Person [name=#{@name}, manager=#{@manager.nil? ? 'nil' : @manager.name}, id=#{@id}]"
  end
end