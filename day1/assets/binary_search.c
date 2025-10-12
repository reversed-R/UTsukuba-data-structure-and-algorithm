#include "../../assets/ceil.h"
#include "../../assets/types.h"
#include "stdio.h"
#include "stdlib.h"

int binary_search(int A[], int d, int n) {
  int l = 0;
  int h = n - 1;
  while (l < h) {
    int m = CEIL_DIV(l + h, 2);
    if (A[m] == d) {
      return TRUE;
    }
    if (d < A[m]) {
      h = m - 1;
    } else {
      l = m + 1;
    }
  }
  printf("A[l]: %d\n", A[l]);
  if (A[l] == d) {
    return TRUE;
  }
  return FALSE;
}

int main(int argc, char *argv[]) {
  int A[] = {7, 10, 14, 33, 38, 39, 46, 47, 54, 59, 67, 75, 78, 84, 97};

  printf("search 40\n");
  binary_search(A, 40, sizeof A / sizeof(int));

  printf("search 90\n");
  binary_search(A, 90, sizeof A / sizeof(int));

  return EXIT_SUCCESS;
}
