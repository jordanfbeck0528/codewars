require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test
  
  def setup
    @linked_list = LinkedList.new
    assert_equal 0, @linked_list.count
    assert_instance_of LinkedList, @linked_list
    assert_nil @linked_list.head
    assert_nil @linked_list.to_string
    @node_1 = @linked_list.append("plop")
    assert_equal "plop", @linked_list.to_string
    assert_instance_of LinkedList::Node, @linked_list.head
    assert_instance_of LinkedList::Node, @node_1
    assert_equal "plop", @node_1.data
    assert_equal 1, @linked_list.count
    assert_nil @node_1.next_node
    @node_2 = @linked_list.append("ping")
    assert_equal "plop ping", @linked_list.to_string
    assert_equal "ping", @linked_list.head.next_node.data
    assert_equal 2, @linked_list.count
    assert_nil @node_2.next_node
    assert_nil @linked_list.head.next_node.next_node
    @node_3 = @linked_list.append("doop")
    assert_equal "plop ping doop", @linked_list.to_string
    assert_equal 3, @linked_list.count
    assert_equal "plop", @linked_list.head.data
  end
  
  def test_it_can_append_nodes
    assert_instance_of LinkedList::Node, @linked_list.head
    assert_equal LinkedList::Node, @linked_list.head.next_node.class
    assert_instance_of LinkedList::Node, @node_1
    assert_instance_of LinkedList::Node, @node_2
    assert_instance_of LinkedList::Node, @node_1.next_node
    assert_equal "plop", @node_1.data
    assert_equal "ping", @node_2.data
    assert_equal "doop", @node_3.data
    assert_equal "plop", @linked_list.head.data
    assert_equal "ping", @linked_list.head.next_node.data
    assert_equal @node_2, @node_1.next_node
    assert_equal 3, @linked_list.count
    assert_instance_of LinkedList::Node, @linked_list.head
    assert_equal LinkedList::Node, @linked_list.head.next_node.class
    assert_equal LinkedList::Node, @linked_list.head.next_node.next_node.class
    assert_instance_of LinkedList::Node, @node_1
    assert_instance_of LinkedList::Node, @node_2
    assert_instance_of LinkedList::Node, @node_3
    assert_instance_of LinkedList::Node, @node_1.next_node
    assert_instance_of LinkedList::Node, @node_1.next_node.next_node
    assert_equal "plop", @node_1.data
    assert_equal "ping", @node_2.data
    assert_equal "doop", @node_3.data
    assert_equal "plop", @linked_list.head.data
    assert_equal "ping", @linked_list.head.next_node.data
    assert_equal "doop", @linked_list.head.next_node.next_node.data
    assert_equal @node_2, @node_1.next_node
    assert_equal @node_3, @node_1.next_node.next_node
    assert_nil @node_2.next_node.next_node
    assert_nil @linked_list.head.next_node.next_node.next_node
  end
end