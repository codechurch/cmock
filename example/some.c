#include <stdio.h>
#include <cualib/base/file.h>

static
int
inside()
{
  printf("inside\n");
  return 1;
}

extern char const *not_have(int);

int
i_have()
{
  printf("i_have\n");
  return 255;
}

static
int
inside2()
{
  printf("inside2\n");
  return 20;
}


int 
foobar( char const *txt )
{
  void tt()
  {
    int ret = inside();
    printf("inside(): %d\n", ret);
  }

  tt();
  
  char const *p = not_have(30);
  printf("not_have(): %s\n", p);
  
  i_have();
  
  inside2();
  return 1;
}


int
main()
{
  return 0;
}

