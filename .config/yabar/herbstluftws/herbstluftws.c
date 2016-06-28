#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>

const char *activeColour = "#64c2a9";
const char *activeUnderline = "single";
const char *spacerString = "  ";

int main(int argc, char **argv){
  int opt;
  char *indiciesString;
  char *index;
  int indicies[64];
  int numIndicies = 0;
  bool yabar = false;

  /* Loop through command-line arguments */
  while ((opt = getopt (argc, argv, "yi:")) != -1)
    switch (opt){
      case 'y':
        yabar = true;
        break;
      case 'i':
        indiciesString = optarg;
        break;
      case '?':
        if (optopt == 'i')
          fprintf (stderr,
            "Option -%c takes a comma-separated list of tag indicies.\n",
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
  
  /* Print specified tags */
  if (yabar == false){
    for (int i = 0; i < numIndicies; i++){
      printf ("%s\n", tags[indicies[i]]);
    }
  } else {
    /* Formatted output for yabar */
    for (int i = 0; i < numIndicies; i++){
      char *currentTag = tags[indicies[i]];
      char *currentTagName = tags[indicies[i]] + 1;
      if (currentTag[0] == '#'){
        printf ("<span underline=\"%s\" underline_color=\"%s\">%s</span>%s",
          activeUnderline, activeColour, currentTagName, spacerString);
      } else if (currentTag[0] == ':'){
        printf ("%s%s", currentTagName, spacerString);
      }
    }
    printf ("\n");
  }

  return EXIT_SUCCESS;
}
