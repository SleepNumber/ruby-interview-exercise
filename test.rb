require File.expand_path(File.dirname(__FILE__) + '/person')
require File.expand_path(File.dirname(__FILE__) + '/person_tree_node')
require File.expand_path(File.dirname(__FILE__) + '/answer')
require "minitest/autorun"
require "securerandom"

class UnitTest < MiniTest::Test 
  def setup
    employees = []
    
    kirk = Person.new(SecureRandom.uuid, 'Kirk', nil)
    employees << kirk
    
    mark = Person.new(SecureRandom.uuid, 'Mark', kirk)
    employees << mark
    
    tom1 = Person.new(SecureRandom.uuid, 'Tom', mark)
    employees << tom1
    
    nick = Person.new(SecureRandom.uuid, 'Nick', tom1)
    employees << nick
    
    ben = Person.new(SecureRandom.uuid, 'Ben', tom1)
    employees << ben
    
    david = Person.new(SecureRandom.uuid, 'David', ben)
    employees << david
    
    stacey = Person.new(SecureRandom.uuid, 'Stacey', nick)
    employees << stacey
    
    corey = Person.new(SecureRandom.uuid, 'Corey', nick)
    employees << corey
    
    tom2 = Person.new(SecureRandom.uuid, 'Tom', stacey)
    employees << tom2
    
    julie = Person.new(SecureRandom.uuid, 'Julie', stacey)
    employees << julie 
    
    employees.shuffle! 
    @root_node = generate_tree(employees)       
  end
  
  def stringify_tree(tree_root)
    result = tree_root.person.name
    unless tree_root.direct_reports.empty?
      result << '{'
      tree_root.direct_reports.sort! {|a,b| a.person.name <=> b.person.name}
      tree_root.direct_reports.each do |dr|
        result << stringify_tree(dr)
      end
      result << '}'
    end
    return result
  end
  
  def test_generate_tree_not_returning_nil
    assert @root_node != nil
  end
  
  def test_generate_tree_returns_a_node
    assert_equal PersonTreeNode, @root_node.class
  end
  
  def test_generate_tree_returns_top_level_employee
    assert_equal "Kirk", @root_node.person.name
  end
  
  def test_generate_tree_returns_correct_hierarchy
    expected = "Kirk{Mark{Tom{Ben{David}Nick{CoreyStacey{JulieTom}}}}}"
    actual = stringify_tree(@root_node)
    assert_equal expected, actual
  end
  
end