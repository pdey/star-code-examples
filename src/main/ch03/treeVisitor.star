worksheet {
  type tree of t is tEmpty or tNode(tree of t, t, tree of t)

  tVisit(tEmpty, _, A) is A
  tVisit(tNode(L, Lb, R), F, A) is let {
    var A1 is tVisit(L, F, A)
    var A2 is F(A1, Lb)
  } in tVisit(R, F, A2)

  check(T, S) is tVisit(T, fn (A, X) => (A or X = S), false)

  count(T) is tVisit(T, fn (A, X) => A + 1, 0)

  -- test
  var IntTree is tNode(tNode(tEmpty, 1, tEmpty),
                 2,
                 tNode(tEmpty, 3, tEmpty))
  assert check(IntTree, 3) = true
  assert check(IntTree, 5) = false
  assert count(IntTree) = 3
}
