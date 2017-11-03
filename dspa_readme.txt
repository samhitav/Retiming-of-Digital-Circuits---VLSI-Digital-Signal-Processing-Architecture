README-
The input file is dspa.txt. The file is written as follows:

First line is the number of nodes in the graph (n).

Next n lines have the weights of the edges of the directed graph in the form of-
initial node   final node   edge weight

Next n lines have the delays of the nodes(gates) which is written in the order of nodes used in the previous lines.

Once the input is given, run the matlab file dspa.m to get the r values of each node in the same order in which input is written and the matrix containing weights of all edges of the graph after retiming. The edges which are non-existent are denoted with a value of infinity.

The example used here, is the same as the one we learnt in class.

Alpha value is taken by default as the delay of the gate with maximum delay. This can be changed by adding the line
alpha = # 
in the code. It is commented as of now.