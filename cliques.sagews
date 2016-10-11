︠3886ae4f-66c8-4cd3-91d6-b953446107af︠


def isOrientedClique(G):
    for v in G.vertices():
        sees = [v]
        ins = G.neighbors_in(v)
        outs = G.neighbors_out(v)
        for u in ins:
            sees.append(u)
            for x in G.neighbors_in(u):
                sees.append(x)
        for z in outs:
            sees.append(z)
            for y in G.neighbors_out(z):
                sees.append(y)
        hood = Set(sees)
        verts = Set(G.vertices())
        if hood != verts:
            return false
    return true

︡85e98fe3-e23e-494b-a82e-1d5a18cf8480︡{"done":true}︡
︠6da1ee51-56b1-4a5d-b535-4f7d49616130s︠
max([2,2,2,3])
︡ac4edbfd-c81f-4362-a73d-b5a152fea314︡︡{"stdout":"3\n"}︡{"done":true}
︠69775533-b515-4cb1-b523-6bafa5855688s︠
def orient(G):
    J = DiGraph()
    for e in G.edges():
        if (random() > 0.5):
            J.add_edge(e[0],e[1])
        else:
            J.add_edge(e[1],e[0])
    return J
︡4cafb8a7-92ba-4bac-b1e3-880b21957f34︡{"done":true}︡
︠92c9b4a1-cedd-4857-96bf-6ba19720087ar︠

### Generate the Graphs that I want to search inside. I know there is one on 11 vertices. So I'll start at 13 and work backwards

graphs13 = []
t=0
for i in range(50000):
    G = graphs.RandomRegular(4,13)
    if G.diameter() == 2:
        flag = 1
        for H in graphs13:
            if H.is_isomorphic(G):
                flag=0
        if flag == 1:
           # print "here"
            graphs13.append(G)
            t = t+1
print '13 generated'
print t
graphs12 = []
t=0
for i in range(50000):
    G = graphs.RandomRegular(4,12)
    if G.diameter() == 2:
        flag = 1
        for H in graphs12:
            if H.is_isomorphic(G):
                flag=0
        if flag == 1:
            graphs12.append(G)
            t = t+1
print '12 generated'
print t

success = []
for G in graphs13:
    for i in range(1000000):
        H = orient(G)
        if isOrientedClique(H):
            print "oriented clique found of order 13"
            success.append(H)
for G in graphs12:
    for i in range(1000000):
        H = orient(G)
        if isOrientedClique(H):
            print "oriented clique found of order 12"
            success.append(H)
print "done"
            
             
︡a248e369-523f-4161-8268-3d4b85add51b︡{"stdout":"13 generated\n"}︡{"stdout":"3\n"}︡{"stdout":"12 generated\n"}︡{"stdout":"25\n"}︡
︠a37e2629-0163-41b4-b127-b8f4d0f903bas︠

#Now let us look for thing with the degree sequence that we want. We we use the same code as above, expect change the graph we are generating,

graphs13 = []
t=0
for i in range(5000):
    G = graphs.DegreeSequenceExpected([3,3,4,4,4,4,4,4,4,4,4,4,4])
    if G.diameter() == 2:
        flag = 1
        for H in graphs13:
            if H.is_isomorphic(G):
                flag=0
        if flag == 1:
           # print "here"
            graphs13.append(G)
            t = t+1
print '13 generated'
print t

success = []
for G in graphs13:
    for i in range(1000):
        H = orient(G)
        if isOrientedClique(H):
            print "oriented clique found of order 13"
            success.append(H)
print "done"
︡0dd5175f-0999-489e-9def-b16162041f90︡{"stdout":"13 generated\n"}︡{"stdout":"3\n"}︡{"stdout":"done\n"}︡{"done":true}︡
︠af51b75d-d27b-4f14-8d6a-60cdbca26e2fs︠


G = graphs.DegreeSequence([3,3,4,4,4,4,4,4,4,4,4,4,4])
G.show()
︡73c526e7-f068-4425-91c3-410eec39ff10︡{"file":{"filename":"/projects/8d9d1aa5-f69b-4cbc-84d7-63604d6df02d/.sage/temp/compute2-us/13443/tmp_VV7ImV.svg","show":true,"text":null,"uuid":"cc97f3b2-6ea4-42ae-8f3c-81650483a121"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠bc964eab-5cb0-4f91-a23a-3386a0324001︠

︡da55d439-18d2-4f62-9457-ecb30c67e4d4︡
︠ae5888ba-1efa-4c38-8c06-50c58d63166es︠

graphs18 = []
t=0
for i in range(500000):
    G = graphs.RandomRegular(5,18)
    if G.diameter() == 2:
        flag = 1
        for H in graphs18:
            if H.is_isomorphic(G):
                flag=0
        if flag == 1:
           # print "here"
            graphs13.append(G)
            t = t+1
print '18 generated'
print t




success = []
for G in graphs18:
    for i in range(1000000):
        H = orient(G)
        if isOrientedClique(H):
            print "oriented clique found of order 18"
            success.append(H)
︡79ffaeeb-180d-42d2-ba15-075902e34822︡{"stdout":"18 generated\n"}︡{"stdout":"0\n"}︡{"done":true}︡
︠13f90925-c7f3-4e7c-8e69-6d480acc407e︠

︡da6eda9b-aea5-44b0-9027-c8f15925ec04︡
︠a33633c8-5678-4293-8608-805b6e314588︠

︡65f13036-09b6-443e-82bd-b1175d7f3d30︡
︠099e204f-5d64-49dc-b3ad-9267bdd92ac2s︠
graphs5 = []
t=0
for i in range(500000):
    G = graphs.DegreeSequenceExpected([2,3,3,3,3])
    if G.diameter() == 2 and max(G.degree()) == 3 :
        flag = 1
        for H in graphs5:
            if flag == 1 and H.is_isomorphic(G):
                flag=0
        if flag == 1:
           # print "here"
            graphs7.append(G)
            #print "found one!"
            t = t+1
print '5 cubic generated'
print t


success = []
s=0
for G in graphs5:
    for i in range(50000):
        H = orient(G)
        if isOrientedClique(H):
            for H in success:
                if H.is_isomorphic(G) == False:
                    success.append(H)
                    s=s+1
print "number of 5-cliques found:"
print s
︡3c4935c4-433c-475a-a4ed-7a82292ca9e4︡︡{"stdout":"5 cubic generated\n"}︡{"stdout":"628\n"}︡{"stdout":"number of 5-cliques found:\n"}︡{"stdout":"0\n"}︡{"done":true}
︠5c0663bd-3201-4125-bb36-5745fbac9758s︠
︡9fe3ef9f-258d-450e-8cc3-b72e06e5ca93︡︡{"done":true}
︠fddd25f6-0599-4efa-a9d8-b2756e02f543︠









