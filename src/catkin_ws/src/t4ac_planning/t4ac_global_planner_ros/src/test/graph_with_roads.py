"""
Graph example with roads connected describing a square geometry.

This is an usefull example to see how basics of netwoks works.

A ------> B
^         |
|         |
|         V
D <------ C

Coordinates of the origin of each road are:
'A' = (0, 2)
'B' = (2, 2)
'C' = (2, 0)
'D' = (0, 0)
"""

import networkx as nx
import matplotlib.pyplot as plt 

G = nx.DiGraph()
edges = ([
    ['A', 'B', {'weight': 2}],
    ['B', 'C', {'weight': 2}],
    ['C', 'D', {'weight': 2}],
    ['D', 'A', {'weight': 2}]
])

pos = {
    'A': (0, 2),
    'B': (2, 2),
    'C': (2, 0),
    'D': (0, 0)
}

G = nx.DiGraph()
G.add_edges_from(edges)
plt.figure()
nx.draw(G, pos, labels={node:node for node in G.nodes()})

edge_labels = {
    ('A', 'B'): G['A']['B']['weight'],
    ('B', 'C'): G['B']['C']['weight'],
    ('C', 'D'): G['C']['D']['weight'],
    ('D', 'A'): G['D']['A']['weight']
}


nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)
plt.show()

route = nx.astar_path(G, 'A', 'D') 
print(route)