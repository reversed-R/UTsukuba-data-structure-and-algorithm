#include "../../assets/types.h"
#include "stdio.h"
#include "stdlib.h"

int fib_recursive(int n) {
  if (n == 0) {
    printf("return 0\n");
    return 0;
  }
  if (n == 1) {
    printf("return 1\n");
    return 1;
  }

  printf("return fib_recursive(%d) + fib_recursive(%d);\n", n - 1, n - 2);
  return fib_recursive(n - 1) + fib_recursive(n - 2);
}

int main(int argc, char *argv[]) {
  printf("==== fib_recursive(3) ====\n");
  fib_recursive(3);

  printf("==== fib_recursive(6) ====\n");
  fib_recursive(6);

  return EXIT_SUCCESS;
}
