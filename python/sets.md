# Sets
{id: python-sets}

## sets
{id: sets}
{i: set}

* Sets in Python are used when we are primarily interested in operations that we know from the [set theory](https://en.wikipedia.org/wiki/Set_theory).
* See also the [Venn diagrams](https://en.wikipedia.org/wiki/Venn_diagram).
* In day to day speach we often use the word "group" instead of "set" even though they are not the same.
* What are the common elements of two set (two groups).
* Is one group (set) the subset of the other?
* What are all the elements that exist in both groups (sets)?
* What are the elements that exist in exactly one of the groups (sets)?

![](img/220px-Venn_A_intersect_B.svg.png)

## set operations
{id: set-operations}
{i: set}
{i: issubset}
{i: intersection}
{i: symmetric_difference}


* set
* issubset
* intersection
* symmetric difference
* union
* relative complement

* [stdtypes: set](http://docs.python.org/library/stdtypes.html#set)

## Creating a set
{id: creating-a-set}

![](examples/sets/create_set.py)
![](examples/sets/create_set.out)

## Creating an empty set
{id: creating-an-empty-set}

![](examples/sets/empty.py)
![](examples/sets/empty.out)


## Adding an element to a set (add)
{id: adding-an-element-to-a-set}

![](examples/sets/add_elements.py)
![](examples/sets/add_elements.out)


## Merging one set into another set (update)
{id: merging-one-set-into-another-set}

![](examples/sets/merge_sets.py)
![](examples/sets/merge_sets.out)



## set intersection
{id: set-intersection}
{i: set}
{i: intersection}

![](examples/sets/intersection.py)

* `intersection` returns the elements that are in both sets.

![](examples/sets/intersection.out)

![](img/180px-Venn0001.svg.png)

## set subset
{id: set-subset}
{i: set}
{i: issubset}

![](examples/sets/subset.py)

![](examples/sets/subset.out)


## set symmetric difference
{id: set-symmetric-difference}
{i: set}
{i: symmetric_difference}

![](examples/sets/difference.py)

* Symmetric difference contains all the elements in either one of the sets, but not in both. "the ears of the elephant".

![](examples/sets/difference.out)

![](img/180px-Venn0110.svg.png)

## set union
{id: set-union}
{i: set}
{i: union}

![](examples/sets/union.py)

![](examples/sets/union.out)


![](img/180px-Venn0111.svg.png)

## set relative complement
{id: set-relative-complement}


![](examples/sets/relative_complement.py)
![](examples/sets/relative_complement.out)

![](img/180px-Venn0010.svg.png)



