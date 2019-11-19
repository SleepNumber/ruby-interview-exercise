# ruby-interview-exercise
:bicyclist: Ruby exercise for Sleep Number interviewees

## Instructions
Convert an array of `Person` objects into a tree of `PersonTreeNode` objects.

### Set-up

1. Clone the repository
3. Open `person.rb`, `person_tree_node.rb`, and `answer.rb` in your favorite editor
4. Add your code to the `generate_tree` method in `answer.rb`

### Solving the Problem

* The exercise uses two Ruby classes: `Person` and `PersonTreeNode`
* The `generate_tree` method receives an array of `Person` objects and should return the root `PersonTreeNode` (CEO)
* Each `PersonTreeNode`'s `direct_reports` array should contain a `PersonTreeNode` for each direct report of that person
* The app will use your `generate_tree` method to evaluate the test
* From the command line, execute 'run test.rb' until the tests pass