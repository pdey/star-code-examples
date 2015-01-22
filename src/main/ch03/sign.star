worksheet {
  sign has type (integer)=>integer
  sign(X) where X < 0 is -1
  sign(0) is 0
  sign(X) default is 1


  assert sign(5) = 1
  assert sign(-5) = -1
  assert sign(5-5) = 0
}
