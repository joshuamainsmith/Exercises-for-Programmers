#include <stdio.h>
#include <stdlib.h>

int main()
{
    char name[20];
    int count = 0;
    int i = 0;

    printf("What is the input string? ");
    scanf("%s", &name);

    printf("%s has %d characters.", name, strlen(name));

    getchar();
}
