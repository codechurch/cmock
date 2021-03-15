#include <stdio.h>
#include <cualib/base/file.h>

#include "some_cmock.h"


CMOCK_CASE(some)
{
  CMOCK_FUNC_VAL(inside, 25);
  
  CMOCK_FUNC(char const *, not_have)( int x )
    {
      CMOCK_INFO("not_have (%d)!!!\n", x);
      return "ABC";
    }

  CMOCK_FUNC(int, i_have)()
    {
      CMOCK_INFO("i_have cmock\n");
      return 1;
    }

  CMOCK_FUNC(int, inside2)()
    {
      printf("---------------inside 2 ---");
      int a = CMOCK_CALL(int, inside2, ());
      printf(" inside2 return %d\n", a);
      return 1;
    }
  
  CMOCK_CALL(int, foobar, ("a"));

  cmock_restore();
  CMOCK_CALL(int, i_have, ());
  //CMOCK_ERROR("aaa");
  //CMOCK_RESULT(1);
}

CMOCK_CASE(other)
{
  CMOCK_ASSERT(1 - 1);
}

int
main()
{
  CMOCK_RUN_CASE(some);
  CMOCK_RUN_CASE(other);
  return cmock_result();
}

