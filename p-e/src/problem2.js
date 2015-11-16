function EvenFibs() {

};

EvenFibs.prototype.genFibs = function(n){
  if (n == 1) { return 1 }
  var fibNums = [1, 2]
  for(i = 2; i < n; i++) {
      EvenFibs.prototype.nextFib(fibNums, i)
    };
  return fibNums;
};

EvenFibs.prototype.fibsUpToCap = function(cap){
  var fibNums = [1, 2];
  var i = 2;
  do {
    EvenFibs.prototype.nextFib(fibNums, i);
    i += 1;
  } while ((fibNums[i-2] + fibNums[i-1]) < cap);
  return fibNums;
};

EvenFibs.prototype.nextFib = function(fibNums, i) {
  fibNums.push(fibNums[i-2] + fibNums[i-1]);
};

EvenFibs.prototype.evenFibsUpTo = function(cap){
  return EvenFibs.prototype.fibsUpToCap(cap).filter(function(element){
    return element % 2 == 0;} );
};

EvenFibs.prototype.genEvenFibs = function(n){
  if (n ==1 ) { return 2 }
  var evenFibNums = [2, 8]
  for (i = 2; i < n; i++){
    EvenFibs.prototype.nextEvenFib(evenFibNums, i)
  };
  return evenFibNums;
};

EvenFibs.prototype.nextEvenFib = function(evenFibNums, i) {
  evenFibNums.push(evenFibNums[i - 2] + 4* evenFibNums[i - 1]);
};

EvenFibs.prototype.evenFibsUpToCap = function(cap){
  var evenFibNums = [2, 8];
  var i = 2;
  do {
    EvenFibs.prototype.nextEvenFib(evenFibNums, i);
    i += 1;
  } while ((evenFibNums[i-2] + 4 * evenFibNums[i-1]) < cap);
  return evenFibNums;
};
