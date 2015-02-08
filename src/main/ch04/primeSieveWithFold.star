worksheet {
  primes(Max) is let {
    cascade(F, K) is fn X=>(F(X) and (X%K != 0))
    prStep ((P,F), X) is F(X) ? (list of [P..,X], cascade(F,X)) | (P,F)
    sieve(C) is first(leftFold(prStep, (list of [2], (fn K=>K%2 != 0)), C))
    first ((L,R)) is L

    iota(Mx, St) where Mx > Max is []
    iota(Mx, St) where Mx=Max is [Mx]
    iota(Cx, St) is list of [Cx,..iota(Cx + St, St)]

  } in sieve(iota(3, 2))

  show primes(1000)
}
