function PrimeFactors() {

};

PrimeFactors.prototype.isPrime = function(p){
  var listPrimes = [2, 3]
  do {
    PrimeFactors.prototype.nextPrime(listPrimes);
  } while (listPrimes[listPrimes.length - 1] < p**2);
  listPrimes.map(function(prime){
    return p % prime == 0;
    }).reduce(function(a,b){
      return a && b;
    })
};

PrimeFactors.prototype.genxPrimes = function(x){

};

PrimeFactors.prototype.nextPrime = function(listPrimes){
    do {
    listPrimes
    i += 2;
  } while ()
};