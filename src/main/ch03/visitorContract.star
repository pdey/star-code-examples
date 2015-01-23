worksheet {
  contract visitor over c determines t is {
    visit has type for all a such that
      (c, (a, t) => a, a) => a
  }

  check(T, S) is visit(T, fn (A, X) => (A or X = S), false)
  count(T) is visit(T, fn (A, X) => A+1, 0)

  type tree of t is tEmpty or tNode(tree of t, t, tree of t)

  tVisit(tEmpty, _, A) is A
  tVisit(tNode(L, Lb, R), F, A) is let {
    var A1 is tVisit(L, F, A)
    var A2 is F(A1, Lb)
  } in tVisit(R, F, A2)


  -- test
  var STree is tNode(tNode(tEmpty, "alpha", tEmpty),
               "beta",
               tNode(tEmpty, "gamma", tEmpty))

  implementation visitor over tree of string determines string is {
    visit = tVisit
  }

  assert check(STree, "gamma") = true
  assert count(STree) = 3
}
