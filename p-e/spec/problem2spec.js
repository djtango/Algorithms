describe("PE Problem 2: Even Fibonacci Numbers:", function() {
  var evenFibs = new EvenFibs()
  it("Class can produce a list of n Fibonacci Numbers", function() {
    expect(evenFibs.genFibs(10)).toEqual([1, 2, 3, 5, 8, 13, 21, 34, 55, 89]);
  });

  it("Class can produce a list of Fibonacci Numbers up to a limit", function(){
    expect(evenFibs.fibsUpToCap(200).pop()).toEqual(144);
  })

  it("Class can filter for only even Fibonacci Numbers", function(){
    expect(evenFibs.evenFibsUpToCap(200)).toEqual([2, 8, 34, 144])
  });
});

