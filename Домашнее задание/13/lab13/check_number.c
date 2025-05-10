#include <stdio.h>
#include <stdlib.h>

int main() {
    int number;
    printf("Введите число: ");
    scanf("%d", &number);

    if (number > 0) {
        exit(1);
    } else if (number < 0) {
        exit(2);
    } else {
        exit(0);
    }
}
