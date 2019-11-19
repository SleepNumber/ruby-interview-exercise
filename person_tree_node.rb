class PersonTreeNode 
  attr_accessor :direct_reports
  attr_reader :person
   
  def initialize(person)
    @person = person
  end
  
  def to_s
    "PersonTreeNode person=[#{@person}] direct_reports=[#{@direct_reports}]"
  end
end