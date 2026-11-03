#include <stdio.h>
#include <ctype.h>
#define MAXBUFFERSIZE 80

int main() {
    char ch;
    char buffer[MAXBUFFERSIZE];
    int char_count;
    int exit_flag = 0;
    int valid_choice;

    printf("Enter your name: ");
    ch = getchar();
    char_count =0;
    while( (ch != '\n') && (char_count < MAXBUFFERSIZE)) { 
       buffer[char_count++] = ch;
       ch = getchar();
    }
    printf("Testing"
    buffer[char_count] = 0x00;
    printf("\nHello ");
    printf("%s\n\n",buffer);
    
    return 0;
}

