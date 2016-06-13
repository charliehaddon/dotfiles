#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv){
  int c;
  char *indiciesString;
  char *index;
  int indicies[64];
  int numIndicies = 0;

  /* Loop through command-line arguments */
  while ((c = getopt (argc, argv, "i:")) != -1)
    switch (c){
      case 'i': 
        indiciesString = optarg;
        break;
      case '?':
        if (optopt == 'i')
          fprintf (stderr, 
              "Option -%c takes a comma-separated list of tag idicies.\n", 
              optopt);
        else
          fprintf (stderr, "Unknown option -%c.\n", optopt);
        return EXIT_FAILURE;
      default:
        return EXIT_FAILURE;
    }
  
  /* Break index string into array */
  index = strtok (indiciesString, ",");
  for (int i = 0; index != NULL; i++){
    indicies[i] = atoi(index);
    index = strtok (NULL, ",");
    numIndicies += 1;
  }
  
  FILE *pipeOut;
  char buffer[512];
  char tagString[512] = "";
  char *tag;
  char *tags[64];

  /* Open pipe to herbstclient & retrieve tag list */
  pipeOut = popen ("herbstclient tag_status", "r");
  if (!pipeOut){
    fprintf (stderr, "Pipe failed to open!\n");
    return EXIT_FAILURE;
  }

  /* Read pipe to string */
  while (fgets (buffer, sizeof (buffer), pipeOut) != NULL){
    strcat (tagString, buffer);
  }

  /* Close pipe */
  if (pclose (pipeOut) != 0){
    fprintf (stderr, "Pipe failed to close!\n");
    return EXIT_FAILURE;
  }
 
  /* Break string into tag array */
  tag = strtok (tagString, "\t");
  for (int i = 0; tag != NULL; i++){
    tags[i] = tag;
    tag = strtok (NULL, "\t");
  }
 
  for (int i = 0; i < numIndicies; i++){
    printf ("%s\n", tags[indicies[i]]);
  }

  return EXIT_SUCCESS;
}
