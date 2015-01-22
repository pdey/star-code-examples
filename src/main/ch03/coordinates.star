worksheet {
  -- Example of ADT : cartesian and polar coordinates
  type point is cart(float, float)
              or polar(float, float)

  -- Euclidean distance
  euclid(cart(X,Y)) is sqrt(X * X + Y * Y)
  euclid(polar(R,T)) is R

  -- Test
  assert euclid(cart(3.0, 4.0)) = 5.0
  assert euclid(polar(3.0, 1.57)) = 3.0

}
