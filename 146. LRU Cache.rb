require 'pry'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = ListNode.new(:head, nil)
    @tail = ListNode.new(:tail, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def remove_node(node)
    node.prev.next = node.next
    node.next.prev = node.prev
    node.prev = nil
    node.next = nil
    node
  end

  def add_to_top(node)
    shifted = @head.next
    @head.next = node
    shifted.prev = node
    node.next = shifted
    node.prev = @head
    node
  end

  def remove_bottom
    removed = @tail.prev
    @tail.prev = removed.prev
    @tail.prev.next = @tail
    removed.prev = nil
    removed.next = nil
    removed
  end
end

class ListNode
  attr_accessor :prev, :next, :value
  attr_reader :key

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class LRUCache

  def initialize(capacity)
    @capacity = capacity
    @cache = {} # key: key, value: node of DoublyLinkedList that holds the value and the adj connections.
    @counter = 0
    @list = LinkedList.new
  end

  def get(key)
    return -1 if @cache[key].nil?

    node = @cache[key]
    @list.remove_node(node)
    @list.add_to_top(node)

    node.value
  end

  def put(key, value)
    if @cache[key]
      set_value(key, value)
      return
    end

    insert_value(key, value)
    nil
  end

  private

  def set_value(key, value)
    node = @cache[key]
    node.value = value
    # updating also changes the LRU statistics
    @list.remove_node(node)
    @list.add_to_top(node)
  end

  def insert_value(key, value)
    node = ListNode.new(key, value)
    @list.add_to_top(node)
    @cache[key] = node
    @counter += 1

    if @counter > @capacity
      removed = @list.remove_bottom
      @cache.delete removed.key
    end
  end
end
