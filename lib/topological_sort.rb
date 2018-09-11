require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# if sparse (|V| abt = |E|) -> O(|V|)
# if dense (|E| much > |V|) -> O(|V|^2)
def topological_sort(vertices)
  sorted = []
  top = []

  # O(|V|)
  vertices.each do |vertex|
    top << vertex if vertex.in_edges.empty?
  end

  # O(|E|) bc of current.out_edges.each
  until top.empty?
    current = top.shift

    current.out_edges.reverse.each do |edge|
      top << edge.to_vertex if edge.to_vertex.in_edges.length == 1
      edge.destroy!
    end

    sorted << current

    vertices.delete(current)
  end

  vertices.empty? ? sorted : []
end
