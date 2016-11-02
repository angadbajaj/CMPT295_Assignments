
#include <stdio.h>

int encode(char *, long *);
void decode(long, char *);

#define NUM_TESTS 12

char tests[NUM_TESTS][40] = {
                   "5",
          "1234567890",
  "999999999999999999",
 "9223372036854775807",
 "9223372036854775808",
 "9999999999999999999",
"11111111111111111111",
"18446744073709551615",
"18446744073709551616",
         "-9876543210",
"-9223372036854775808",
"-9223372036854775809"};

char decodes[NUM_TESTS][40];

long result;
int OF;

void main () {
    int i;

    for (i = 0; i < NUM_TESTS; i++) {
        if (i) {
            puts(".-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.");
        }
        OF = encode(tests[i], &result);
        printf("The encoding of %s\n            was %ld%s.\n", tests[i], result, OF ? " and there was overflow" : "");
        decodes[i][0] = 0;
        decode(result, decodes[i]);
        if (decodes[i][0]) {
            printf("BONUS - Decode: %s.\n", decodes[i]);
        }
    }
    return;
}

