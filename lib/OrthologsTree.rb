#!/usr/bin/env ruby

require 'SimpleTree.rb'
class OrthologsTree 
    include SimpleTree

    attr_reader :name, :value

    def initialize(parent, value)
        @value = value
        @parent = parent
        @children = []
        @name =value
    end

    def <<(value)
        if exist?(value)
  
#            subtree = OrthologsTree.new(locateParent(value), value)
#            @children << subtree
#            return subtree
             return locateParent(value)
        else
            subtree = OrthologsTree.new(self, value)
            @children << subtree
            return subtree
        end 
    end

    def children()
        @children
    end

    def parent()
        @parent
    end

    def exist?(value)
        ret = false
        @children.each do |c|
            if c.value == value
                ret = true
                break
            end
        end
        return ret
    end

    def locateParent(parent)
        ret = self
        @children.each do |c|
            if c.value == parent
                ret = c
                break
            end
        end
        return ret 
    end

end

=begin
ortho = OrthologsTree.new(nil, 'root')
#t1 = ortho << "Child1"
ortho << 'kegg'
ortho << 'eggnog'
ortho << 'kegg' << 'T1'
#ortho << 'kegg' << 'T1'
ortho << 'eggnog' << 'Trypanosoma cruzi' << 'T2'
#ortho << 'eggnog' << 'Trypanosoma cruzi' << 'T1'
#t1 << "Child1.1"
#puts ortho.tree_rep
#ortho.put('kegg', 'T1.1')
#ortho.put('kegg', 'T2.2')
puts '================================='
puts ortho.tree_rep
puts '================================='
ortho.family.each do |f|
    puts f.value if f.parent == ortho
end
#puts ortho.inspect
#puts ortho.is_root?
#puts ortho.grandparent

=end