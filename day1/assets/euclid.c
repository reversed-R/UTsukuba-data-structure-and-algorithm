#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
  int *tmp = x;
  x = y;
  y = tmp;
}

int euclid(int n, int m) {
  if (n < m) {
    swap(&n, &m);
  }

  while (m != 0) {
    int r = n % m;
    printf("%d\n", r);
    n = m;
    m = r;
  }

  return n;
}

int main(int argc, char *argv[]) {
  printf("euclid(12345, 678)\n");
  euclid(12345, 678);

  printf("euclid(2025, 1006)\n");
  euclid(2025, 1006);

  return EXIT_SUCCESS;
}
