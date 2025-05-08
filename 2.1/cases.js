function factorial(n) {
    if (n === 0 || n === 1) return 1;
    return n * factorial(n - 1);
}
  
const permutation = (n, r) => factorial(n)/factorial(n-r);
const multiPermutation = (n, r) => n**r;
const combination = (n, r) => factorial(n)/(factorial(n-r)*factorial(r));
const multiCombination = (n, r) => combination(n+r-1,r);

module.exports = {
    permutation: permutation,
    multiPermutation: multiPermutation,
    combination: combination,
    multiCombination: multiCombination,
};
    