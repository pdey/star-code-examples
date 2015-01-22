worksheet {
  -- Tree of string
  type sTree is sEmpty or sNode(sTree, string, sTree)

  sTest(sEmpty, _) is false
  sTest(sNode(L, Lb, R), S) is Lb = S or sTest(L, S) or sTest(R, S)

  -- test
  assert sTest(sEmpty, "alpha") = false
  var T is sNode(sNode(sEmpty, "alpha", sEmpty),
            "beta",
            sNode(sEmpty, "gamma", sEmpty))
  assert sTest(T, "alpha") = true
  assert sTest(T, "delta") = false
}
