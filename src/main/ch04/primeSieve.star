worksheet {
  primes(Max) is let {
    filterMultiples(K, L) is filter(fn X=>X%K != 0, L)

    sieve ([]) is []
    sieve([N,..rest]) is [N,..sieve(filterMultiples(N, rest))]

    iota(Mx,St) where Mx > Max is []
    iota(Mx,St) where Mx=Max is [Mx]
    iota(Cx,St) is list of [Cx,..iota(Cx+St,St)]

  } in list of [2,..sieve(iota(3, 2))]

  show primes(1000)

}
