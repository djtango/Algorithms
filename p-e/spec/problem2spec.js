describe("PE Problem 2: Even Fibonacci Numbers", function() {
  it("can produce a list of Fibonacci Numbers ", function() {
    var evenFibs = new EvenFibs()
    expect(evenFibs.genFibs(10)).toEqual([1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
  });
});