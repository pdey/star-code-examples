worksheet {
  type tree of t is tEmpty or tNode(tree of t, t, tree of t)

  pickSome(none,A) is A
  pickSome(A,none) is A
  pickSome(A,B) default is A

  findInTree(tEmpty, K) is none
  findInTree(tNode(L, (K1, V1), R), K) where K=K1 is some(V1)
  findInTree(tNode(L, (K1, V1), R), K) default is pickSome(findInTree(L, K),findInTree(R, K))

  setKinTree(tEmpty, K, V) is tNode(tEmpty, (K,V), tEmpty)
  setKinTree(tNode(L, (K1, V1), R), K, V) where (K = K1) is tNode(L, (K, V), R)
  setKinTree(tNode(L, (K1, V1), R), K, V) where (K < K1) is tNode(setKinTree(L, K, V), (K1, V1), R)
  setKinTree(tNode(L, (K1, V1), R), K, V) where (K > K1) is tNode(L, (K1, V1), setKinTree(R, K, V))

  removeKfromTree(tEmpty, K) is tEmpty
  removeKfromTree(tNode(L, (K1, V1), R), K) where (K < K1) is tNode(removeKfromTree(L, K), (K1, V1), R)
  removeKfromTree(tNode(L, (K1, V1), R), K) where (K > K1) is tNode(L, (K1, V1), removeKfromTree(R, K))
  removeKfromTree(tNode(tEmpty, (K1, V1), R), K) where (K = K1) is R
  removeKfromTree(tNode(L, (K1, V1), tEmpty), K) where (K = K1) is L
  removeKfromTree(tNode(L, (K1, V1), R), K) where (K = K1) is let {
    deleteMax(tNode(L1, X, tEmpty)) is (X, L1)
    deleteMax(tNode(L1, X, R1)) is let {
      var (M, T) is  deleteMax(R1)
    } in (M, tNode(L1, X, T))

    var (M1, T1) is  deleteMax(L)
  } in tNode(T1, M1, R)

  implementation for all k, v such that
    indexable over tree of ((k, v)) determines (k, v) where
    comparable over k and equality over k is {
      _index(T, K) is findInTree(T, K)
      _set_indexed(T, K, V) is setKinTree(T, K, V)
      _delete_indexed(T, K) is removeKfromTree(T, K)
  }

  -- test
  var Tt is tNode(tEmpty, ("alpha", "one"), tEmpty)
  assert Tt["alpha"] = "one"
  var U is Tt[with "beta" -> "two"]
  assert U["alpha"] = "one"
  assert present U["beta"]
  assert U["beta"] = "two"
  assert not present U["gamma"]
  var Vv is Tt[with "alpha" -> "updated"]
  assert Vv["alpha"] = "updated"

  -- test delete
  var Uu is U[with "gamma" -> "three"]
  var Nu is Uu[with "delta" -> "four"]
  var Xu is Nu[with "aleph"-> "zero"]
  show Xu
  var Du is Xu[without "alpha"]
  show Du
  assert not present Du["alpha"]
}
