#include <iostream>

int add(int edi, int esi )
{
  if(edi == 0)
  {
    return esi ;
  }
  else if(esi  == 0)
  {
    return edi;
  }

  int eax  = edi;

  while(esi  != 0)
  {
    edi = eax;
    edi  = edi & esi ;
    eax = eax ^ esi ;
    edi = edi << 1;
    esi  = edi;

  }
  return eax;
}
int multiplesi (int big, int small)
{
  if(big < small)
  {
    int temp = small;
    small = big;
    big = temp;
  }

  int result = big;

  for(int i = 1; i < small; i++)
  {
    result = add(result,big);
    std::cout << result << std::endl;
  }
  return result;
}

int main()
{
  int edi = 10;
  int esi  = 20;

  int edi_plus_esi  = add(edi,esi );
  int edi_times_esi  = multiplesi (edi,esi );

  std::cout << "edi + esi  = " << edi_plus_esi  << " and edi * esi  = " <<  edi_times_esi  << std::endl;
  return 0;

}
