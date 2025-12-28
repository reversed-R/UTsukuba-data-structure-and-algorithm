#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#define N 5
#define M INT_MAX

int w[N][N] = {{M, M, 20, 100, M},
               {M, M, M, 50, 10},
               {M, 20, M, M, 100},
               {M, M, 80, M, M},
               {M, M, 50, 10, M}};
int d[N] = {};
int S[N] = {false, false, false, false, false};

void print_array(int arr[], int n) {
  printf("{");
  for (int i = 0; i < n; i++) {
    if (arr[i] == M) {
      printf(" M,");
    } else {
      printf(" %d,", arr[i]);
    }
  }
  printf("}\n");
}

bool remain(int s[], int n) {
  for (int i = 0; i < n; i++) {
    if (!s[i]) {
      return true;
    }
  }

  return false;
}

int select_min(int d[], int s[], int n) {
  int min = INT_MAX;
  int min_idx = 0;
  for (int i = 0; i < n; i++) {
    if (!s[i] && d[i] < min) {
      min = d[i];
      min_idx = i;
    }
  }

  return min_idx;
}

void dijkstra(int p) {
  S[p] = true;

  for (int i = 0; i < N; i++) {
    d[i] = w[p][i];
  }

  printf("S:\n");
  print_array(S, N);
  printf("d:\n");
  print_array(d, N);

  while (remain(S, N)) {
    int u = select_min(d, S, N);
    S[u] = true;

    printf("----\n");
    printf("u: %d\n", u);
    printf("S:\n");
    print_array(S, N);

    for (int x = 0; x < N; x++) {
      if (w[u][x] != M) {
        int k = d[u] + w[u][x];
        if (k < d[x]) {
          d[x] = k;
        }
      }
    }

    printf("d:\n");
    print_array(d, N);
  }
}

int main() { dijkstra(0); }
