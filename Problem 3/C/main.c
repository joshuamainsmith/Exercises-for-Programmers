#include <stdio.h>
#include <stdlib.h>

int main()
{
    char quote[100], author[20];

    printf("What is the quote? ");
    fgets(quote, 100, stdin);
    strtok(quote, "\n");

    printf("Who said it? ");
    fgets(author, 20, stdin);
    strtok(author, "\n");

    printf("%s says \"%s\"", author, quote);

    return 0;
}
