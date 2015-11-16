describe("PE Problem 3: Prime factors", function(){
  var primeFactors = new PrimeFactors()

  it("Class can find the next prime from a list of primes", function() {
    expect(primeFactors.nextPrime([2, 3, 5])).toEqual([2, 3, 5, 7])
  })

  it("Class can check whether p is prime", function() {
    expect(primeFactors.isPrime(13)).toBe(true)
  })
  it("Class can check whether n is not prime", function(){
    expect(primeFactors.isPrime(15)).toBe(false)
  })
  it("Class can produce a list of prime numbers", function(){
    expect(primeFactors.genxPrimes(10))
  })
})