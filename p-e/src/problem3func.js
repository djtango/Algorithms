var primeFactors = {

};

PrimeFactors.prototype.isPrime = function(p){
  var listPrimes = [2, 3]
  var isPrime = function(prime){
    return p % prime !== 0;
  }
  var and = function(a, b){
      return a && b;
  }
  this._findPrimesUptoRoot(p, listPrimes)
  return listPrimes.map(isPrime)
                   .reduce(and);
};

PrimeFactors.prototype.genxPrimes = function(x){
  if (x == 1) { return [2]; };
  if (x == 2) { return [2, 3]; };
  var listPrimes = [2, 3];
  for (var i = 3; i <= x; i++) {
    this.nextPrime(listPrimes);
  }
  return listPrimes;
};

PrimeFactors.prototype._findPrimesUptoRoot = function(p, listPrimes){
  do {
    PrimeFactors.prototype.nextPrime(listPrimes);
  } while (Math.pow(listPrimes[listPrimes.length - 1], 2) < p);
  return listPrimes;
};

PrimeFactors.prototype.nextPrime = function(listPrimes){
  var i = listPrimes[listPrimes.length - 1]
  var notPrime = function(prime){ return i % prime === 0; }
  var or = function(first, second){ return first || second }
  do {
    i += 2;
  } while (listPrimes.map(notPrime).reduce(or));
  listPrimes.push(i);
  return listPrimes;
};

PrimeFactors.prototype.factorise = function(p, listPrimes){
  listPrimes = listPrimes || [2, 3]
  this._findPrimesUptoRoot(p, listPrimes)
  if (this._isFactorised(p, listPrimes)) {
    return this._mapfactors(p, listPrimes);
  } else {
    return this._filterOnesAndSort(this._mapfactors(p, listPrimes)
                .concat(this.factorise( p / this._factorsProduct(p,listPrimes),
                listPrimes)));
  };
};

PrimeFactors.prototype._mapfactors = function(p, listPrimes) {
  return listPrimes.map( (primes) => {return p % primes == 0 ? primes : 1} )
};

PrimeFactors.prototype._factorsProduct = function(p, listPrimes) {
  return this._mapfactors(p, listPrimes).reduce( (factor1, factor2) => {
    return factor1 * factor2;
  })
};

PrimeFactors.prototype._isFactorised = function(p, listPrimes) {
  return p / this._factorsProduct(p, listPrimes) === 1;
};

PrimeFactors.prototype._filterOnesAndSort = function(factors) {
  var allOnes = function(factor) {
    return factor !== 1;}
  var byNumbers = function(num1, num2) {
      return num1 - num2;}
  return factors.filter(allOnes)
                .sort(byNumbers);
};

/*
var primeFactors = (function() {

  return {
    isPrime: isPrime
  }

  function isPrime() {

  }

  function

  function
}())
*/