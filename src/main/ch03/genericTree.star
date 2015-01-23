worksheet {
  type tree of t is tEmpty or tNode(tree of t, t, tree of t)

  test(tEmpty, _) is false
  test(tNode(L, Lb, R), F) is F(Lb) or test(L, F) or test(R, F)

  check(T, S) is test(T, fn X => X = S)

  -- test
  var ST is tNode(tNode(tEmpty, "alpha", tEmpty),
            "beta",
            tNode(tEmpty, "gamma", tEmpty))
  assert check(ST, "gamma") = true
  assert check(ST, "delta") = false
}
