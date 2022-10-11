"""
Basic example about how to create a weighted DiGraph in networkx

       2      2     1
--->A----->B---->C---->D
|   |            ^     |
|   |      3     |     |
|   --------------     |
|          8           |
-----------<------------
"""

import networkx as nx
import matplotlib.pyplot as plt 

G = nx.DiGraph()
edges = ([
    ['A', 'B', {'weight': 2}],
    ['B', 'C', {'weight': 2}],
    ['C', 'D', {'weight': 1}],
    ['A', 'C', {'weight': 3}],
    ['D', 'A', {'weight': 8}]
])

G.add_edges_from(edges)
pos = nx.spring_layout(G)
plt.figure()
nx.draw(G, pos, labels={node:node for node in G.nodes()})

edge_labels = {
    ('A', 'B'): G['A']['B']['weight'],
    ('B', 'C'): G['B']['C']['weight'],
    ('C', 'D'): G['C']['D']['weight'],
    ('A', 'C'): G['A']['C']['weight'],
    ('D', 'A'): G['D']['A']['weight']
}

nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)
plt.show()
