worksheet {
  average(C) is leftFold((+), 0, C)/size(C)

  assert average(list of [1,2,3,4,5]) = 3
}
